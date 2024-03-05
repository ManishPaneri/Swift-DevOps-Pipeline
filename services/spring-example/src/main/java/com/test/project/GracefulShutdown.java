package com.test.project;

import lombok.extern.log4j.Log4j2;
import org.apache.catalina.connector.Connector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@Log4j2
public class GracefulShutdown implements TomcatConnectorCustomizer, ApplicationListener<ContextClosedEvent> {

    private volatile Connector connector;

    @Value("${server.graceful.shutdown.wait.timeout.sec:30000}")
    private long timeout;

    @Override
    public void customize(Connector connector) {
        this.connector = connector;
    }

    @Override
    public void onApplicationEvent(ContextClosedEvent contextClosedEvent) {

        log.info("Tomcat shutting down, allowing {} seconds for threadpool to shutdown gracefully", timeout);
        this.connector.pause();
        Executor executor = this.connector.getProtocolHandler().getExecutor();
        if (executor instanceof ThreadPoolExecutor) {
            try {
                ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) executor;
                threadPoolExecutor.shutdown();
                if (!threadPoolExecutor.awaitTermination(timeout, TimeUnit.SECONDS)) {
                    log.warn("Tomcat thread pool did not shut down gracefully within {} milli-seconds. "
                            + "Proceeding with forceful shutdown", timeout);
                }
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
            }
        }

    }
}

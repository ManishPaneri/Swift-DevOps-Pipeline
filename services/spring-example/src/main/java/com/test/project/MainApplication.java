package com.test.project;

import lombok.extern.log4j.Log4j2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@Log4j2
public class MainApplication {
	public static void main(String[] args) {
		log.info("Starting Application");
		SpringApplication.run(MainApplication.class, args);
	}
}

apt install wget
apt install lsof

# Install Golang using the below bash script.
wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
tar -C /usr/local/ -xzf go1.13.5.linux-amd64.tar.gz
PATH=$PATH:/usr/local/go/bin
export PATH

# Install Java using the below bash script.
wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
mv jdk-13.0.1 /usr/
JAVA_HOME='/usr/jdk-13.0.1'
PATH="$JAVA_HOME/bin:$PATH"
export PATH

# Install maven using the below bash script
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvf apache-maven-3.6.3-bin.tar.gz
mv apache-maven-3.6.3 /usr/
M2_HOME='/usr/apache-maven-3.6.3'
PATH="$M2_HOME/bin:$PATH"
export PATH

# install Python using  below bash script
apt install python
apt install pip

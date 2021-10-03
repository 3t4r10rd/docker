FROM ubuntu:18.04
WORKDIR /home/azureuser/lesson6
RUN apt update
RUN apt-get install -y tomcat8
RUN apt-get install -y maven
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR target
ADD hello-1.0.war /var/lib/tomcat8/webapps
RUN service tomcat8 restart
EXPOSE 8080
CMD ["catalina.sh", "run"]
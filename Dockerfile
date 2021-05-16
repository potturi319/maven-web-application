FROM ubuntu
RUN apt -y update && apt install -y wget
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.zip
RUN apt install -y unzip
RUN mkdir /opt/tomcat
RUN unzip apache-tomcat-9.0.46.zip
RUN mv apache-tomcat-9.0.46/*  /opt/tomcat/.
RUN apt install -y default-jre
RUN  chmod u+x /opt/tomcat/bin/*.sh
COPY ./target/maven-web-application*.war /opt/tomcat/webapps/mavenwebapp.war
EXPOSE 8080
ENTRYPOINT ["/opt/tomcat/bin/catalina.sh","run"]

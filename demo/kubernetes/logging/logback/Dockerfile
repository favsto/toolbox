FROM tomcat:9.0.24-jdk13-openjdk-oracle

COPY src/main/resources/logback-cloud.xml /usr/local/tomcat/lib/logback.xml

COPY target/logback-0.0.1.war /usr/local/tomcat/webapps/logback.war
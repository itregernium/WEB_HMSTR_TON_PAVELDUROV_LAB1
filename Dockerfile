FROM tomcat:9.0.1-jre8-alpine

ADD ./src/main/webapp /usr/local/tomcat/webapps/webapp
ADD ./src/main/resources /usr/local/tomcat/webapps/webapp/WEB-INF/classes
CMD ["catalina.sh", "run"]

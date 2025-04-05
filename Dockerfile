FROM tomcat:10
ADD ./giteshproject/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8081
CMD ["catalina.sh","run"]

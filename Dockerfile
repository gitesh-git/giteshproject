FROM tomcat:10
ADD */gitesh-project/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8081
CMD ["catalina.sh","run"]

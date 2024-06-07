FROM tomcat:9
ADD */gitesh-project-pipeline/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8081
CMD ["catalina.sh","run"]

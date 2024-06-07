FROM tomcat
ADD gitesh-project-pipeline/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]

FROM tomcat
ADD /home/test-admin/.jenkins/workspace/gitesh-project-pipeline/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]

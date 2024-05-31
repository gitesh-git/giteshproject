FROM tomcat
LABEL latest
ADD /home/test-admin/.jenkins/workspace/giteshproject-pipeline/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]

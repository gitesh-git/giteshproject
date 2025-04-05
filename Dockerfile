FROM tomcat:10
ADD /home/gitesh-sangole/.jenkins/workspace/giteshproject/target/giteshproject.war /usr/local/tomcat/webapps/
EXPOSE 8081
CMD ["catalina.sh","run"]

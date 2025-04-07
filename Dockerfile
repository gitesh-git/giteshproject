FROM tomcat
ADD /home/gitesh-sangole/.jenkins/workspace/giteshproject/target/giteshproject.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

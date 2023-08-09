#Build a JAR File
FROM maven:3.6.3-jdk-8-slim AS stage1
COPY . /opt 
#RUN mvn -f /home/app/pom.xml clean package
#RUN mvn -f /home/app/pom.xml clean package
RUN mvn -f /opt/pom.xml clean install package

#Create an Image
FROM tomcat:latest
EXPOSE 8080
COPY --from=stage1 addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]


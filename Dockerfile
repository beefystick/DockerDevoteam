FROM registry.access.redhat.com/ubi8/ubi

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.tar.gz

RUN tar xvfz apache-tomcat-9.0.87.tar.gz

#RUN mv /apache-tomcat-10.1.19/ /opt/tomcat/.

RUN yum -y install java-11-openjdk-devel
RUN java -version

COPY target/petclinic.war /apache-tomcat-9.0.87/webapps/

EXPOSE 8080

CMD ["/apache-tomcat-9.0.87/bin/catalina.sh", "run"]
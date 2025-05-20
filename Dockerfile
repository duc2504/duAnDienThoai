FROM tomcat:10.1.34-jdk17-temurin

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR đã build vào Tomcat và rename thành ROOT.war để truy cập qua "/"
COPY target/myapp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

FROM tomcat:10.1.7-jdk17

# Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR (ví dụ: myapp.war) vào thư mục webapps
COPY target/myapp.war /usr/local/tomcat/webapps/ROOT.war

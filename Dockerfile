FROM openjdk:17-jdk-slim

WORKDIR /app

# 파일 복사
COPY src/main/resources/data.sql /docker-entrypoint-initdb.d/
COPY build/libs/*.war app.war

# 이미지 파일 복사 (EC2의 이미지 디렉토리에서)
# COPY src/main/resources/static/images/* src/main/resources/static/images/

ENV SPRING_PROFILES_ACTIVE=prod

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.war"]
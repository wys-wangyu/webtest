# =====================================================================
# 1. Build with: docker build -t wendell/restful-api-demo .
# 2. Run with: docker run -p 8081:8081 -d --name restful-api-demo wendell/restful-api-demo
# @see: https://spring.io/guides/gs/spring-boot-docker/#_containerize_it
# =====================================================================
FROM openjdk:8-jdk-alpine
RUN mv /etc/apk/repositories /etc/apk/repositories.bak
RUN echo "https://mirrors.aliyun.com/alpine/v3.8/main/" > /etc/apk/repositories \
  && echo "https://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories \
  && apk add --no-cache tzdata \
  && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone \
  && apk del tzdata
VOLUME /tmp
RUN echo ${JAR_FILE} 
ADD webtest-0.0.1-SNAPSHOT.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java -jar $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom /app.jar" ]
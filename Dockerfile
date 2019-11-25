# =====================================================================
# 1. Build with: docker build -t wendell/restful-api-demo .
# 2. Run with: docker run -p 8081:8081 -d --name restful-api-demo wendell/restful-api-demo
# @see: https://spring.io/guides/gs/spring-boot-docker/#_containerize_it
# =====================================================================
FROM openjdk:8-jdk
RUN echo "deb http://mirrors.aliyun.com/debian stretch main contrib non-free" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "Asia/Shanghai" > /etc/timezone
RUN apt-get update && apt-get install -y tzdata && dpkg-reconfigure -f noninteractive tzdata
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-cp","app:app/lib/*","com.wangyu.webtest.WebtestApplication"]
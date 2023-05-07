FROM gradle:jdk17-alpine
RUN apk update
RUN apk add git openssh

ADD /Cookies.yml /Cookies.yml
WORKDIR /
RUN git clone https://github.com/jianjianai/NewBingGoGo-Web NewBingGoGo-Web

WORKDIR /NewBingGoGo-Web
RUN gradle shadow

WORKDIR /
RUN mv -f /NewBingGoGo-Web/build/libs/NewBingGoGo-web-1.0-SNAPSHOT-all.jar /run.jar
RUN rm -rf /NewBingGoGo-Web
EXPOSE 80
ENV PORT=80
CMD sh -c  "java -jar /run.jar \$PORT"

FROM node:4
MAINTAINER cartman640

RUN addgroup --gid 22022 dgroup
RUN useradd --uid 22022 -g dgroup druser

RUN mkdir /app
WORKDIR /app

ADD src/package.json /app/package.json

RUN npm install

COPY ["./drunner", "/drunner"]
COPY src /app/src

RUN chown -R druser:dgroup /app

VOLUME /data
VOLUME /app

EXPOSE 1337

USER druser

CMD ["npm", "start"]
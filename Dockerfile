FROM node:4
MAINTAINER cartman640

RUN addgroup --gid 22022 dgroup
RUN useradd --uid 22022 -g dgroup druser -d /home/druser -m

RUN npm install -g grunt-cli

RUN mkdir /app && chown druser:dgroup /app
WORKDIR /app
USER druser

ADD src/package.json /app/package.json

RUN npm install

COPY ["./drunner", "/drunner"]
COPY src /app/src

WORKDIR /app/src

VOLUME /config
VOLUME /app/src
VOLUME /app/src/.tmp

EXPOSE 1337

CMD ["npm", "start"]
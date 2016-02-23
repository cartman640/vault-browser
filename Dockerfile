FROM node:4
MAINTAINER cartman640

# RUN addgroup --gid 22022 dgroup
# RUN useradd --uid 22022 -g dgroup druser -d /home/druser -m

RUN addgroup --gid 1000 dgroup
RUN useradd --uid 1000 -g dgroup druser -d /home/druser -m

RUN npm install -g nodemon

RUN mkdir -p /app/src/.tmp && mkdir -p /app/src/node_modules && chown -R druser:dgroup /app
WORKDIR /app/src
USER druser

ADD src/package.json /app/src/package.json

RUN npm install

COPY ["./drunner", "/drunner"]
COPY src /app/src

VOLUME /config
VOLUME /app/src
VOLUME /app/src/.tmp
VOLUME /app/src/node_modules

EXPOSE 1337

CMD ["npm", "start"]
FROM adinstruments/node
MAINTAINER cartman640

RUN npm install -g nodemon

RUN mkdir -p /app/src/.tmp && mkdir -p /app/src/node_modules && chown -R druser:drgroup /app

EXPOSE 1337
WORKDIR /app/src

ADD src/package.json /app/src/package.json

RUN npm install

COPY ["./drunner", "/drunner"]
COPY src /app/src

RUN chown druser:drgroup /app/src/*
RUN chown -R druser:drgroup /app/src/.tmp/
USER druser

VOLUME ["/config"]

CMD ["npm", "start"]
FROM node:16-alpine AS builder

WORKDIR /usr/app
ADD . /

COPY .npmrc /app/src/app/.npmrc
COPY .azure-access.key /root/.npmrc

RUN apk upgrade --update \
  && apk add git \
  && npm install -g npm@9.6.6 \
  && apk add -U tzdata \
  && cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
  && apk del tzdata \
  && rm -rf /var/cache/apk/*

RUN npm i --quiet

CMD npm run start

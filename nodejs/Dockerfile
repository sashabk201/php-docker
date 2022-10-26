FROM node:12-alpine

MAINTAINER Pavel Kushnerevich <MW2Consulting>

RUN npm install npm@latest -g

RUN rm -rf /npm-cache
RUN mkdir -p /npm-cache
RUN mkdir /app

RUN npm config set cache /npm-cache --global
RUN chown 1000 /npm-cache /app

RUN apk add git

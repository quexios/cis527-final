FROM node:18-alpine

RUN apk add --no-cache nginx

RUN mkdir -p /run/nginx
COPY frontend/ /usr/share/nginx/html

WORKDIR /app
COPY backend/package*.json ./
RUN npm install
COPY backend/ .
COPY default.conf /etc/nginx/http.d/default.conf
EXPOSE 80

CMD node server.js & nginx -g 'daemon off;'
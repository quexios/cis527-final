FROM node:18-alpine
WORKDIR /app
COPY backend/package*.json ./
RUN npm install
COPY backend/ .

FROM nginx:alpine
COPY frontend/ /usr/share/nginx/html
EXPOSE 80
CMD ["node", "/app/server.js"]
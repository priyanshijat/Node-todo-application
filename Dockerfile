#stage 1
FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 8000

CMD ["node", "app.js"] 

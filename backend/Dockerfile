# backend/Dockerfile
FROM node:16
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install cors
COPY . .
EXPOSE 5000
CMD ["node", "index.js"]
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# EXPOSE command is read by AWS Elastic Beanstalk
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
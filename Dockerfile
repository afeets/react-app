# build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# copy files from the build phase 
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
# nginx automatically loads, so no need to execute RUN command
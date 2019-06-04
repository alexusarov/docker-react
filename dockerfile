FROM node:alpine as builder
WORKDIR '/react_app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /react_app/build /usr/share/nginx/html

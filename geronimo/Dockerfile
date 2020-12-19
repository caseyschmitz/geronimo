FROM node:14-alpine as build
WORKDIR /frontend/app
RUN pwd
COPY frontend/package*.json ./
RUN npm install
COPY ./frontend .
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /frontend/app/dist /geronimo/frontend
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log
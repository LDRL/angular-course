#Primera Etapa
FROM node:14-alpine as build

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY ./ /usr/src/app/

RUN npm install

RUN npm run build


#Segunda Etapa
FROM nginx:1.17.10-alpine

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/src/app/dist/angular-course /usr/share/nginx/html

# Expose port 80
EXPOSE 80

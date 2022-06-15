#FROM nginx:1.17.1-alpine
#FROM mcr.microsoft.com/dotnet/monitor:6
#COPY nginx.conf /etc/nginx/nginx.conf
#COPY /dist/my-app /usr/share/nginx/html
# Stage 1: Compile and Build angular codebase


FROM node:latest as build
WORKDIR /usr/local/app
COPY ./app /usr/local/app/
RUN npm install
RUN npm run build
FROM nginx:latest
COPY --from=build /usr/local/app/dist/my-app /usr/share/nginx/html
EXPOSE 80

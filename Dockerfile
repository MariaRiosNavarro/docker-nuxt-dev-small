FROM node:18-alpine
WORKDIR /docker-nuxt
COPY . .
EXPOSE 3000
CMD ["npm","run", "dev", "--", "--host"]

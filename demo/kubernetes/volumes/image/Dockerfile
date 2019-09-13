FROM node:12.9.1-alpine

# metadata
LABEL maintainer="fausto.fusaro@injenia.it"

# network exposition
EXPOSE 8080 

# setup application
WORKDIR /usr/src/app

COPY simple-site/package*.json ./
RUN npm install 
COPY simple-site .

# command entrypoint
CMD ["node", "index.js"]
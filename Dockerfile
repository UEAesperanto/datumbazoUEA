FROM node:latest

WORKDIR /app

RUN apt-get update && apt-get install -y \
    mysql-client \
&& rm -rf /var/lib/apt/lists/*

RUN npm install -g nodemon mocha
EXPOSE 3000

COPY ./ /app
RUN npm install

CMD [ "bash", "/app/entrypoint.sh"]

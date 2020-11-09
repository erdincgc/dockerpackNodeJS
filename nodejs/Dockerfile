FROM node:12

LABEL maintainer="Erdinc G. Corbaci <erdincgc@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV APPENV ${APPENV}

RUN echo  ${APPENV}

# Create app directory
WORKDIR /usr/src/app

RUN apt-get update
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./api/package*.json ./
COPY ./api/nodemon*.json ./
COPY ./api/.babelrc ./
RUN npm i -g nodemon 
RUN npm i -g rimraf
###RUN npm i -g yarn
RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
##COPY . .
#ADD ./api /usr/src/app

EXPOSE 8080

###CMD [ "node", "server.js" ]







# Install packages
#RUN apt-get install -y \
# nano

#RUN usermod -u 1000 www-data

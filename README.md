# dockerPackNodejs

Docker Compose setup to run NodeJS Apps and MongoDB with RabbitMq
Includes MongoExpress administration panel 
# Purpose

Create the whole development environment.

# Install

- Install Docker and [docker-compose](https://docs.docker.com/compose/install/).
On Windows 10 install Docker Toolbox and [disable Hyper-V](http://www.poweronplatforms.com/enable-disable-hyper-v-windows-10-8/).

- cd to parent dir of your project
- git clone https://github.com/erdincgc/dockerpackNodeJS.git dockerfiles
- preferably rename project dir as "api" for quick run without configuration

# Project setup
-Project root

|- api (nodejs api app)

|- dockerfiles (this repo-DO NOT RENAME)

|- socketapi (nodejs socket app -optional)

|- worker (nodejs worker app to consume rabbitMQ -optional)



* The approot is at /usr/src/app/
* Database access is
  host: mongodb
  user: root 
  password: 

# Run

* On Linux.
	- sh build.sh 
	  or 
	- `git clone https://github.com/soft-industry/docker-compose-php.git`
	- `cd docker-compose-php`
	- `docker-compose build`
	- `docker-compose up -d`
* On Windows 10.
	- sh machinebuild.sh 
         or
	- Place the project within the Users directory
	- Open Docker quickstart terminal
	- Using command prompt navigate to the project directory
	- Run `docker-compose build` and `docker-compose up -d` as usual

#Stop containers 
	- sh destroy.sh / destroymachine.sh

# Test

* On Linux/Mac.
	- Open url http://localhost:5000
	- MongoExpress http://localhost:8081 ( see composer.yml files for passwords )
* On Windows 10.
	- In the Docker quickstart terminal run `docker-machine ls`
	- Open the ip of your docker machine with port 5000
	- MongoExpress http://localhost:8081

# Command reference

* `docker-compose exec db bash` will open shell on the running db container.
* `docker-compose stop` will stop running containers.
* `docker-compose rm db` will erase built db container. So when you run `docker-compose up` it will be built again, and the initial dump will apply.


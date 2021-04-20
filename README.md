# Gin Serverless Container GCP Deployment Template

🚀 This is a template for web apps using Golang, Gin, Docker and  Google Cloud Run

![cover](https://i.morioh.com/2343c2078f.png)

- [Building](#building)
  - [Binary](#binary)
  - [Makefile](#makefile)
  - [Docker](#docker)
  - [Docker-compose](#docker-compose)
  - [Kubernetes](#kubernetes)
- [Deploying](#deploying)
  - [Push container](#build-container)
  - [Deploy Cloud Run](#deploy-cloud-run)
- [Testing](#testing)
  - [Unit Tests](#unit-tests)
- [Continuous Integration](#continuous-integration)

## Building

By far, the easiest way to get everything running is with `docker-compose`. See the [docker-compose](#docker-compose) section. First, set up the environment variables for your project. You can use the `.env.example`:

```shell
$ source .env.example
```

### Binary

To build the binary, run the following:

```shell
$ go build -o ${APP_NAME}
```

To run the binary, run the following:

```shell
$ ./${APP_NAME}
```

Or simply:

```shell
$ go run main.go
```

### Makefile

To run the through the Makefile, run the following

```shell
$ source .env

$ make run
```

### Docker

Make sure you have [Docker](https://www.docker.com/get-started) installed on your machine.

To build the Docker image, run the following:

```shell
$ docker build . -t ${APP_NAME}            
```

To run the Docker image, run:

```shell
$ docker run -p ${PORT}:${PORT} ${APP_NAME}
```

### docker-compose

To run the docker-compose:

```shell
$ docker-compose up
```
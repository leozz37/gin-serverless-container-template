# Gin Serverless Container GCP Deployment Template

🚀 This is a template for web apps using Golang, Gin, Docker and  Google Cloud Run

![cover](https://i.morioh.com/2343c2078f.png)

[![Build](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/build.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/build.yml)
[![Unit Tests](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/unit_tests.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/unit_tests.yml)
[![Docker](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/docker.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/docker.yml)
[![Terraform](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/terraform.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/terraform.yml)

- [Quick Start](#quick-start)
- [Building](#building)
  - [Binary](#binary)
  - [Makefile](#makefile)
  - [Docker](#docker)
  - [Docker-compose](#docker-compose)
- [Deploying](#deploying)
  - [Push Docker Image](#build-docker-image)
  - [Deploy Cloud Run](#deploy-cloud-run)
- [Testing](#testing)
  - [Unit Tests](#unit-tests)
- [Continuous Integration](#continuous-integration)

## Quick Start

To make your app into production, first create a GCP project and set a billing account for it. And then run the following commands:

Build and push the container to GCP container image registry:

```shell
$ gcloud builds submit
```

Apply the Terraform infra to GCP:

```
$ cd terraform/

$ terraform init

$ terraform apply
```

You will be asked for the project id and the Docker image URL.

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

## Deploying

To deploy your container to [Google Cloud Run](https://cloud.google.com/run), follow these steps:

### Push Docker Image

First, push your Docker image to GCP's registry with the Google Cloud Build. We've setted up the pushing instructions on `cloudbuild.yaml` file:

```shell
$ gcloud build submit
```

Take note of your Docker image url.

### Deploy Cloud Run

First you need a Google Cloud project set up and a billing account. Take a look into [this docs](https://cloud.google.com/resource-manager/docs/creating-managing-projects) on how to create a project if you don't have one, and your billing account is setted for it (run: `$ open "https://console.cloud.google.com/billing/linkedaccount?project=$PROJECT_ID"`). Now let's get our application into production with [Terraform](https://www.terraform.io/). Cd to `terraform/` directory and init it:

```shell
$ cd terraform/

$ terraform init
```

Now apply the infra into your Google Cloud project:

```shell
$ terraform apply
```

You will be asked for your `PROJECT_ID` and the `DOCKER_IMAGE_URL` of your application.
## Testing

The unit testes are written with the default testing tool of Golang.

### Unit Tests

To run the unit tests, do the following:

```shell
$ go test -v ./...
```

To run the tests with coverage, do the following:

```shell
$ go test -v -covermode=count ./...
```

Or use the `Makefile`:

```shel
$ make test
```

## Continuous Integration

We use GitHub Actions for our CI tool. Right now we have four workflows, and you can check they state [here](https://github.com/leozz37/gin-serverless-container-template/actions):

[![Build](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/build.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/build.yml) - Building the binary status.

[![Unit Tests](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/unit_tests.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/unit_tests.yml) - Unit tests status.

[![Docker](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/docker.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/docker.yml) - Building the Docker image status.

[![Terraform](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/terraform.yml/badge.svg)](https://github.com/leozz37/gin-serverless-container-template/actions/workflows/terraform.yml) - Terraform plan

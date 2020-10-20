[![Docker Automated Build](https://img.shields.io/docker/automated/tammoippen/docker-gcloud-pubsub-emulator.svg)](https://hub.docker.com/r/tammoippen/docker-gcloud-pubsub-emulator/) 
[![Docker Build Status](https://img.shields.io/docker/build/tammoippen/docker-gcloud-pubsub-emulator.svg)](https://hub.docker.com/r/tammoippen/docker-gcloud-pubsub-emulator/builds/) 
[![Docker Pulls](https://img.shields.io/docker/pulls/tammoippen/docker-gcloud-pubsub-emulator.svg)](https://hub.docker.com/r/tammoippen/docker-gcloud-pubsub-emulator/) 
[![Docker Stars](https://img.shields.io/docker/stars/tammoippen/docker-gcloud-pubsub-emulator.svg)](https://hub.docker.com/r/tammoippen/docker-gcloud-pubsub-emulator/) 
[![License](https://img.shields.io/github/license/tammoippen/docker-gcloud-pubsub-emulator.svg)](https://raw.githubusercontent.com/tammoippen/docker-gcloud-pubsub-emulator/blob/master/LICENSE.md)

**NOTE** This is a fork using my (tammoippen) prefered options. Also, host and port can be set via env vars.

# [Google Cloud Pub/Sub Emulator Image](https://hub.docker.com/r/tammoippen/docker-gcloud-pubsub-emulator/)

[*Cloud Pub/Sub*](https://cloud.google.com/pubsub/) is a global service for real-time and reliable messaging and streaming data

This image provides a dockerized version of the *Google Cloud Pub/Sub Emulator*. It is intended to be used as a service on development environments (it **SHOULD NOT** be used in production environments). You can check *Cloud Pub/Sub* documentation on [Google Cloud Platform documentation website](https://cloud.google.com/pubsub/docs/).

## Usage
The following shell statement show the most simple execution of the provided image. It will execute the *Pub/Sub Emulator* that will listen on port 8538.

```sh
docker run --rm --tty --interactive --publish 8538:8538 -e PORT 8538 -e HOST 0.0.0.0 tammoippen/docker-gcloud-pubsub-emulator
```

## Configuration
The most important configuration parameters of the *Pub/Sub emulator* image are the host/port value the server will listen on and the directory where data files will be placed. By default, the image is configured to listen on `127.0.0.1:8538` and store its files in the `/data` directory. This behavior can be changed by providing the correct environment variables.

The following example shows how to start the *Pub/Sub emulator* to listen on `192.168.1.3:12345`.

```sh
docker run --rm --tty --interactive -e PORT 12345 -e HOST 192.168.1.3 tammoippen/docker-gcloud-pubsub-emulator
```

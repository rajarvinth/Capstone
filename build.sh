#!/bin/bash

#Docker image build step
docker build -t capdockerimg .

#Docker compose file for container
docker-compose up -d

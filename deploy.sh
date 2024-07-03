#Fetching the current Git branch
#!/bin/bash

#Stop and remove existing containers
docker-compose down

#Docker login
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

#Docker Prod step
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker tag capdockerimg arvinthraj/prodcap1:v1
    docker push arvinthraj/prodcap1:v1

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker tag capdockerimg arvinthraj/devcap1:v1
    docker push arvinthraj/devcap1:v1
fi



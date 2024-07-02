#Fetching the current Git branch
#!/bin/bash

#Stop and remove existing containers
docker-compose down

#Docker login
docker login -u arvinthraj --password dckr_pat_Mb9SYa6cILLou8FmsKcn4GUPgTA

#Docker Prod step
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker tag capdockerimg arvinthraj/devcap1:v1
    docker push arvinthraj/devcap1:v1

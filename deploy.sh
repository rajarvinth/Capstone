#Fetching the current Git branch
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current Git Branch: $GIT_BRANCH"


#Stop and remove existing containers
docker-compose down

#Docker login
docker login -u $DOCKER_USERNAME --password $DOCKER_PASSWORD

#Docker Prod step
if [[ "$GIT_BRANCH" == "dev" ]]; then
        ./build.sh
        docker tag capdockerimg arvinthraj/prodcap1:v1
        docker push arvinthraj/prodcap1:v1

elif [[ "$GIT_BRANCH" == "main" ]]; then
        ./build.sh
        docker tag capdockerimg arvinthraj/devcap1:v1
        docker push arvinthraj/devcap1:v1

fi

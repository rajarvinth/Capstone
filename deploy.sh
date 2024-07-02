#Fetching the current Git branch
BRANCH_NAME=${BRANCH_NAME:-$(git rev-parse --abbrev-ref HEAD)}
echo "Current Git Branch: ${BRANCH_NAME}"


#Stop and remove existing containers
docker-compose down

#Docker login
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

#Docker Prod step
if [[ "${BRANCH_NAME}" == "Prod" ]]; then
        ./build.sh
        docker tag capdockerimg arvinthraj/prodcap1:v1
        docker push arvinthraj/prodcap1:v1

elif [[ "${BRANCH_NAME}" == "Dev" ]]; then
        ./build.sh
        docker tag capdockerimg arvinthraj/devcap1:v1
        docker push arvinthraj/devcap1:v1
        
else    
        echo "Deployment Failed: Unsupported branch ${BRANCH_NAME}"

fi

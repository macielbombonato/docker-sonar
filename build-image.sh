export DOCKER_REPO="macielbombonato"
export SERVICE_NAME="docker-sonar"
export VERSION="latest"

echo 'Building image'
docker build --rm -t ${DOCKER_REPO}/${SERVICE_NAME}:${VERSION} -f Dockerfile .
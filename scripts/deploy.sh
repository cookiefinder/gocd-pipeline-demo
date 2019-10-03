set -x
set -e

export RANCHER_URL=http://10.10.2.156:8080/v2-beta/projects/1a5
export RANCHER_ACCESS_KEY=5DDF562931940D0E908A
export RANCHER_SECRET_KEY=E2DiEkoApQrS713Zp9BnKdLGZruQqkJWnQp4mAwz

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.10.2.156:5000
fi
IMAGE_NAME=${DOCKER_REGISRTY}/pipeline-demo:${GO_PIPELINE_COUNTER}

sed -i "s#<IMAGE_NAME>#$IMAGE_NAME#g" docker-compose.yml

rancher-compose -p pipeline-demo up -d -c --upgrade

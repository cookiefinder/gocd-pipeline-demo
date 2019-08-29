set -x
set -e

export RANCHER_URL=http://10.202.129.3:8080/v1/projects/1a5
export RANCHER_ACCESS_KEY=4FE2F16E90B6EED1A0AB
export RANCHER_SECRET_KEY=2QizbCdBgqXbCN6BXPEqsB65LvnrxqEQoJaKoq8w

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.202.129.3:5000
fi
IMAGE_NAME=${DOCKER_REGISRTY}/pipeline-demo:${GO_PIPELINE_COUNTER}

sed -i "s#<IMAGE_NAME>#$IMAGE_NAME#g" docker-compose.yml

rancher-compose -p mst-user-service up -d -c --upgrade
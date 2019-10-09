set -x
set -e

export RANCHER_URL=http://10.202.129.3:8080/v2-beta/projects/1a5
export RANCHER_ACCESS_KEY=CBD96C58B80EE2F4DEA8
export RANCHER_SECRET_KEY=VUxBtLyfxYhGtBdAgqfuwrG9CtkjRg21TrfEwMNJ

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.202.129.3:5000
fi
IMAGE_NAME=${DOCKER_REGISRTY}/pipeline-demo:${GO_PIPELINE_COUNTER}

sed -i "s#<IMAGE_NAME>#$IMAGE_NAME#g" docker-compose.yml

rancher-compose -p pipeline-demo up -d -c --upgrade

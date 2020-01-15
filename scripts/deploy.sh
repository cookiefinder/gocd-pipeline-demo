set -x
set -e

export RANCHER_URL=http://10.202.129.3:8080/v2-beta/projects/1a5
export RANCHER_ACCESS_KEY=CFCEB960EDF6BC719190
export RANCHER_SECRET_KEY=mEDL2LKbom4UqATXcDN2pxkX7zPoR3m1vuRTfrKA

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.202.129.3:5000
fi
IMAGE_NAME=${DOCKER_REGISRTY}/pipeline-demo:${GO_PIPELINE_COUNTER}

sed -i "s#<IMAGE_NAME>#$IMAGE_NAME#g" docker-compose.yml

rancher-compose -p pipeline-demo up -d -c --upgrade

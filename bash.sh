#!/bin/bash
CONTAINER_ID=$1
if [[ -z $CONTAINER_ID ]]; then
	echo "Please add container id"
	exit 0
fi
for i in `ls binaries/`; do
	docker cp binaries/$i $CONTAINER_ID:/bin
	echo "Install :" $i
done
docker exec -it $CONTAINER_ID /bin/busybox sh

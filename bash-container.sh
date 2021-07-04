#! /bin/sh

if [[ -z "${BITCOIN_CONTAINER}" ]]; then
    echo "Please set \$BITCOIN_CONTAINER"
    exit 0
fi

docker exec -it ${BITCOIN_CONTAINER} bash

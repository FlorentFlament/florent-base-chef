#!/usr/bin/env sh

DATA_DIRS="berks-cookbooks data_bags roles"
VAGRANT_DIR="/vagrant"

# Generate berks-cookbooks
berks update
berks vendor

# Update vagrant data directories
for DIR in $DATA_DIRS; do
    rm -r ${VAGRANT_DIR}/${DIR}
    cp -r ${DIR} ${VAGRANT_DIR}
done

rm -r berks-cookbooks
git rev-parse HEAD > ${VAGRANT_DIR}/revision

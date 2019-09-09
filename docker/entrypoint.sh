#!/usr/bin/env bash

set -x

if [ -n "$ENABLE_RANGER_HIVE_PLUGIN" ]; then
    echo "Enabling ranger hive plugin..."
    cd $RANGE_HIVE_PLUGIN_DIR
    bash -c "export JAVA_HOME=/docker-java-home/jre && ./enable-hive-plugin.sh"
fi

cd $HIVE_HOME
exec "$@"
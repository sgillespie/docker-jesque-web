#!/bin/sh

export JETTY_CONTEXT=${JETTY_CONTEXT:-/}
export REDIS_HOST=${REDIS_HOST:-localhost}
export REDIS_PORT=${REDIS_PORT:-6379}
export REDIS_TIMEOUT=${REDIS_TIMEOUT:-5000}
export REDIS_PASSWORD=${REDIS_PASSWORD}
export REDIS_NAMESPACE=${REDIS_NAMESPACE:-resque}
export REDIS_DATABASE=${REDIS_DATABASE:-0}

# Generate redis.properties
CONFIG_ROOT="/jesque-web/WEB-INF/classes/META-INF/spring"
envsubst < "${CONFIG_ROOT}/redis.properties.tmpl" \
    > "${CONFIG_ROOT}/redis.properties"

# Generate jetty context file
WEBAPP_ROOT="${JETTY_BASE}/webapps"
envsubst < "${WEBAPP_ROOT}/jesque-web.xml.tmpl" \
    > "${WEBAPP_ROOT}/jesque-web.xml"

# Run the jetty image's entrypoint
exec /docker-entrypoint.sh

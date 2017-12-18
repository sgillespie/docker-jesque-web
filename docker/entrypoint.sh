#!/bin/sh

export REDIS_HOST=${REDIS_HOST:-localhost}
export REDIS_PORT=${REDIS_PORT:-6379}
export REDIS_TIMEOUT=${REDIS_TIMEOUT:-5000}
export REDIS_PASSWORD=${REDIS_PASSWORD}
export REDIS_NAMESPACE=${REDIS_NAMESPACE:-resque}
export REDIS_DATABASE=${REDIS_DATABASE:-0}

# Generate redis.properties
CONFIG_ROOT="${JETTY_BASE}/webapps/ROOT/WEB-INF/classes/META-INF/spring"
envsubst < "${CONFIG_ROOT}/redis.properties.tmpl" > "${CONFIG_ROOT}/redis.properties"

# Run the jetty image's entrypoint
exec /docker-entrypoint.sh

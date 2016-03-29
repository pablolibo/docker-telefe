#!/bin/bash
set -e
sysctl -w net.core.somaxconn=65535
sysctl -w vm.overcommit_memory=1
echo never > /sys/kernel/mm/transparent_hugepage/enabled
# allow the container to be started with `--user`
#if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
#	chown -R redis .
#	exec gosu redis "$BASH_SOURCE" "$@"
#fi
exec gosu redis redis-server /usr/local/etc/redis/redis.conf "$@"
exec "$@"

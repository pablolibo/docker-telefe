#!/bin/bash
set -euo pipefail
sysctl -w net.core.somaxconn=65535
cat /proc/sys/net/core/somaxconn

exec "$@"

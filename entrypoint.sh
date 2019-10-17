#!/bin/bash
set -eu

rm -f /app/tmp/pids/server.pid

exec "$@"

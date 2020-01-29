#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /open-source-billing/tmp/pids/server.pid
rm -f /open-source-billing/tmp/pids/puma.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
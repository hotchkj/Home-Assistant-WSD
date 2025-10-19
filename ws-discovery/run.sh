#!/usr/bin/env bashio

# Get configuration options
WORKGROUP=$(bashio::config 'workgroup')
HOSTNAME=$(bashio::config 'hostname')
DOMAIN=$(bashio::config 'domain')
INTERFACE=$(bashio::config 'localsubnet')
DEBUG=$(bashio::config 'debug')

# Build wsdd command arguments
ARGS=""

# Add workgroup
if [ -n "$WORKGROUP" ]; then
    ARGS="$ARGS --workgroup $WORKGROUP"
fi

# Add hostname if specified
if [ -n "$HOSTNAME" ]; then
    ARGS="$ARGS --hostname $HOSTNAME"
fi

# Add domain if specified (disables workgroup)
if [ -n "$DOMAIN" ]; then
    ARGS="$ARGS --domain $DOMAIN"
fi

# Add interface if specified
if [ -n "$INTERFACE" ]; then
    ARGS="$ARGS --interface $INTERFACE"
fi

# Add verbose flag if debug is enabled
if bashio::var.true "$DEBUG"; then
    ARGS="$ARGS --verbose"
fi

bashio::log.info "Starting WS-Discovery daemon..."
bashio::log.info "Arguments: $ARGS"

# Run wsdd
exec python3 /usr/local/bin/wsdd.py $ARGS

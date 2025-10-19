#!/usr/bin/env bashio

# Get configuration options
WORKGROUP=$(bashio::config 'workgroup')
HOSTNAME=$(bashio::config 'hostname')
DOMAIN=$(bashio::config 'domain')
LOCALSUBNET=$(bashio::config 'localsubnet')
DEBUG=$(bashio::config 'debug')

# Build wsdd command
WSDD_CMD="/usr/local/bin/wsdd.py"

# Add workgroup
if [ -n "$WORKGROUP" ]; then
    WSDD_CMD="$WSDD_CMD -w $WORKGROUP"
fi

# Add hostname if specified
if [ -n "$HOSTNAME" ]; then
    WSDD_CMD="$WSDD_CMD -n $HOSTNAME"
fi

# Add domain if specified (disables workgroup)
if [ -n "$DOMAIN" ]; then
    WSDD_CMD="$WSDD_CMD -d $DOMAIN"
fi

# Add local subnet if specified
if [ -n "$LOCALSUBNET" ]; then
    WSDD_CMD="$WSDD_CMD -i $LOCALSUBNET"
fi

# Add verbose flag if debug is enabled
if bashio::var.true "$DEBUG"; then
    WSDD_CMD="$WSDD_CMD -v"
fi

bashio::log.info "Starting WS-Discovery daemon..."
bashio::log.info "Command: $WSDD_CMD"

# Run wsdd
exec python3 $WSDD_CMD

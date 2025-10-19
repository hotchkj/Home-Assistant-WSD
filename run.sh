#!/usr/bin/with-contenv bashio

# Get configuration options
WORKGROUP=$(bashio::config 'workgroup')
HOSTNAME=$(bashio::config 'hostname')

bashio::log.info "Starting WS-Discovery daemon..."
bashio::log.info "Workgroup: ${WORKGROUP}"

# Build wsdd command arguments array
WSDD_ARGS=("-w" "${WORKGROUP}")

# Add hostname if specified
if [ -n "${HOSTNAME}" ]; then
    bashio::log.info "Hostname: ${HOSTNAME}"
    WSDD_ARGS+=("-n" "${HOSTNAME}")
fi

# Start wsdd
bashio::log.info "Running: wsdd ${WSDD_ARGS[*]}"
exec wsdd "${WSDD_ARGS[@]}"

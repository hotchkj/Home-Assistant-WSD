#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting WS-Discovery daemon..."

# Build command line arguments
ARGS=()

# Workgroup
WORKGROUP=$(bashio::config 'workgroup')
ARGS+=( "-w" "${WORKGROUP}" )

# Hostname
if bashio::config.has_value 'hostname'; then
    HOSTNAME=$(bashio::config 'hostname')
    ARGS+=( "-n" "${HOSTNAME}" )
fi

# Domain
if bashio::config.has_value 'domain'; then
    DOMAIN=$(bashio::config 'domain')
    ARGS+=( "-d" "${DOMAIN}" )
fi

# Interfaces (array)
if bashio::config.has_value 'interface'; then
    # Use bashio to iterate array safely
    mapfile -t IFACES < <(bashio::jq '.[ ]' <<< "$(bashio::config 'interface')")
    for interface in "${IFACES[@]}"; do
        ARGS+=( "-i" "${interface}" )
    done
fi

# IPv4 only
if bashio::config.true 'ipv4only'; then
    ARGS+=( "-4" )
fi

# IPv6 only
if bashio::config.true 'ipv6only'; then
    ARGS+=( "-6" )
fi

# Hop limit
HOPLIMIT=$(bashio::config 'hoplimit')
ARGS+=( "-H" "${HOPLIMIT}" )

# Preserve case
if bashio::config.true 'preserve_case'; then
    ARGS+=( "-p" )
fi

# Discovery mode
if bashio::config.true 'discovery'; then
    ARGS+=( "-D" )
fi

# Disable HTTP
if bashio::config.true 'no_http'; then
    ARGS+=( "-t" )
fi

# Verbosity
VERBOSE=$(bashio::config 'verbose')
if [ "${VERBOSE}" -eq 1 ]; then
    ARGS+=( "-v" )
elif [ "${VERBOSE}" -ge 2 ]; then
    ARGS+=( "-v" "-v" )
fi

# Short log style
ARGS+=( "-s" )

# Chroot
if bashio::config.has_value 'chroot'; then
    CHROOT=$(bashio::config 'chroot')
    if [ -n "${CHROOT}" ]; then
        ARGS+=( "-c" "${CHROOT}" )
    fi
fi

# User
if bashio::config.has_value 'user'; then
    USER=$(bashio::config 'user')
    if [ -n "${USER}" ]; then
        ARGS+=( "-u" "${USER}" )
    fi
fi

# UUID
if bashio::config.has_value 'uuid'; then
    UUID=$(bashio::config 'uuid')
    if [ -n "${UUID}" ]; then
        ARGS+=( "-U" "${UUID}" )
    fi
fi

# Metadata timeout
METADATA_TIMEOUT=$(bashio::config 'metadata_timeout')
ARGS+=( "--metadata-timeout" "${METADATA_TIMEOUT}" )

# Source port
SOURCE_PORT=$(bashio::config 'source_port')
if [ "${SOURCE_PORT}" -ne 0 ]; then
    ARGS+=( "--source-port" "${SOURCE_PORT}" )
fi

bashio::log.info "Starting wsdd with arguments: ${ARGS[*]}"

# Exec wsdd with arguments
exec python3 /usr/local/bin/wsdd "${ARGS[@]}"

ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install wsdd
# Note: --break-system-packages is required for Python 3.11+ on Alpine (PEP 668)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    && pip3 install --no-cache-dir --break-system-packages wsdd

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python and required tools
RUN apk add --no-cache \
    python3 \
    wget \
    tar

# Fetch wsdd from release tarball
RUN wget -O /tmp/wsdd.tar.gz https://github.com/christgau/wsdd/archive/refs/tags/v0.9.tar.gz && \
    tar -xzf /tmp/wsdd.tar.gz -C /tmp && \
    cp /tmp/wsdd-0.9/src/wsdd.py /usr/local/bin/wsdd.py && \
    chmod +x /usr/local/bin/wsdd.py && \
    rm -rf /tmp/wsdd.tar.gz /tmp/wsdd-0.9

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Run the service
CMD [ "/run.sh" ]

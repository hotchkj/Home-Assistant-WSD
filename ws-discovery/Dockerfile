ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python and wget for fetching wsdd.py
RUN apk add --no-cache \
    python3 \
    wget

# Fetch wsdd.py from christgau/wsdd at specific commit for deterministic builds
RUN wget -O /usr/local/bin/wsdd.py \
    https://raw.githubusercontent.com/christgau/wsdd/e9325b5ce312423f9b83f7175949694097a161b2/src/wsdd.py && \
    chmod +x /usr/local/bin/wsdd.py

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Run the service
CMD [ "/run.sh" ]

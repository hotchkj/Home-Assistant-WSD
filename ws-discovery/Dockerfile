ARG BUILD_FROM
FROM $BUILD_FROM

# Install runtime deps
RUN apk add --no-cache python3 py3-pip curl \
    && pip3 install --no-cache-dir defusedxml

# Fetch exact wsdd.py from upstream at referenced commit (deterministic)
RUN curl -fsSL -o /usr/local/bin/wsdd \
    https://raw.githubusercontent.com/christgau/wsdd/e9325b5ce312423f9b83f7175949694097a161b2/src/wsdd.py \
    && chmod +x /usr/local/bin/wsdd

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

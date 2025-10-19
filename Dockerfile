ARG BUILD_FROM
FROM ${BUILD_FROM}

WORKDIR /usr/src/app

# Install required packages
RUN apk add --no-cache \
    python3 \
    curl

# Download wsdd directly from the official repository
# Using a specific version for reproducibility
RUN curl -L https://raw.githubusercontent.com/christgau/wsdd/master/src/wsdd.py -o wsdd.py \
    && chmod +x wsdd.py

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

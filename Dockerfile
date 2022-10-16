ARG BUILD_FROM
FROM $BUILD_FROM

RUN \
  apk add --no-cache \
    python3 \
    && pip install \
        paho_mqtt==1.5.1 \
        jsonschema==4.4.0
# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

# Copy data for add-on
COPY run.sh /
COPY rootfs /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

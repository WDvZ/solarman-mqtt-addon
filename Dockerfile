ARG BUILD_FROM
FROM $BUILD_FROM

LABEL maintainer "Martijn Pepping <martijn.pepping@automiq.nl>"
LABEL org.opencontainers.image.source https://github.com/mpepping/solarman-mqtt

ADD . /opt/app-root/src/
WORKDIR /opt/app-root/src

RUN \
    apk add --no-cache \
    python3 && \
    python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

ENV PATH=/opt/venv/bin:$PATH

ENTRYPOINT ["python", "run.py"]
CMD ["-d"]

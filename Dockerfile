FROM alpine:3.8

LABEL maintainer="Drone.IO Community <drone-dev@googlegroups.com>" \
  org.label-schema.name="Drone Codecov" \
  org.label-schema.vendor="Drone.IO Community" \
  org.label-schema.schema-version="1.0"

RUN apk add -U ca-certificates python3 && \
    rm -rf /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade pip setuptools wheel six twine

ADD release/linux/amd64/drone-pypi /bin/
ENTRYPOINT ["/bin/drone-pypi"]

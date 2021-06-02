FROM softinstigate/serverless:2.19.0

RUN addgroup bar && \
    adduser --home /home --shell /bin/sh --disabled-password --ingroup bar --gecos "" foo

ADD entrypoint.sh /entrypoint

ENTRYPOINT ["/entrypoint"]

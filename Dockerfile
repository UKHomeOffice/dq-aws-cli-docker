FROM alpine:3.8

ARG BUILD_VOLUME='/workdir'
ARG BUILD_DIR='test'

ENV USERMAP_UID 1000

ENV VOLUME=$BUILD_VOLUME
ENV VOLUME_DIR=$BUILD_DIR

RUN apk -v --update add \
python \
py-pip \
groff \
less \
mailcap \
shadow \
&& \
pip install --upgrade pip && \
pip install --upgrade awscli s3cmd python-magic && \
apk -v --purge del py-pip && \
rm /var/cache/apk/*

RUN mkdir -p \
    /workdir \
    /home/runner/.aws \
    $VOLUME/$VOLUME_DIR

RUN groupadd -r runner && \
    useradd --no-log-init -u $USERMAP_UID -r -g runner runner && \
    groupadd docker && \
    usermod -aG docker runner && \
    chown -R runner:runner /home/runner/.aws && \
    chown -R runner:runner $VOLUME

VOLUME [$VOLUME]
RUN chown -R runner:runner $VOLUME

WORKDIR ${VOLUME}

USER ${USERMAP_UID}

ENTRYPOINT ["aws"]

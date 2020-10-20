# Google Cloud Pub/Sub Documentation
# https://cloud.google.com/pubsub/docs/

# https://cloud.google.com/sdk/docs/quickstart#deb

FROM debian:stretch-slim
LABEL maintainer="Tammo Ippen <tammo.ippen@posteo.de>" \
      version="1.0" \
      description="Google Cloud Pub/Sub Emulator - Settings via env."

EXPOSE 8538

VOLUME /data

ENV PORT=8538 \
    HOST=0.0.0.0

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1 \
 && apt-get update -y \
 && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
        | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
 && apt-get -y install \
    apt-transport-https \
    ca-certificates \
    gnupg \
    curl \
 && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
        | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
 && apt-get update -y \
 && apt-get install -y \
    google-cloud-sdk-pubsub-emulator \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

CMD gcloud beta emulators pubsub start \
    --host-port=${HOST}:${PORT} \
    --data-dir=/data \
    --log-http \
    --verbosity=debug \
    --user-output-enabled

# Google Cloud Pub/Sub Documentation
# https://cloud.google.com/pubsub/docs/

FROM google/cloud-sdk
LABEL maintainer="Tammo Ippen <tammo.ippen@posteo.de>" \
      version="0.1" \
      description="Google Cloud Pub/Sub Emulator - Settings via env."

EXPOSE 8538

VOLUME /data

ENV PORT=8538 \
    HOST=0.0.0.0

CMD gcloud beta emulators pubsub start \
    --host-port=${HOST}:${PORT} \
    --data-dir=/data \
    --log-http \
    --verbosity=debug \
    --user-output-enabled

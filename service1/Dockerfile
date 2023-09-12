FROM alpine:3.18.3

RUN apk add --no-cache bash
RUN apk add --no-cache netcat-openbsd

COPY ./scripts/source_and_run.sh /scripts/source_and_run.sh
COPY ./scripts/wait-for-it.sh /scripts/wait-for-it.sh

COPY ./app/start_service.sh /app/start_service.sh

RUN chmod +x /scripts/source_and_run.sh /scripts/wait-for-it.sh /app/start_service.sh

ENTRYPOINT ["/scripts/source_and_run.sh"]

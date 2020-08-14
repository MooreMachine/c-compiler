FROM alpine:3.12.0

RUN apk add \
    gcc=9.3.0-r2 \
    libc-dev

FROM alpine:3.12.0

RUN apk add \
    cmake=3.17.2-r0 \
    gcc=9.3.0-r2 \
    g++=9.3.0-r2 \
    libc-dev=0.7.2-r3 \
    make=4.3-r0

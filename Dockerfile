FROM alpine:latest

RUN apk add --no-cache wget ca-certificates xz

RUN wget -O naive.tar.xz https://github.com/klzgrad/naiveproxy/releases/download/v120.0.6099.43-1/naiveproxy-v120.0.6099.43-1-linux-x64.tar.xz \
    && tar -xf naive.tar.xz \
    && rm naive.tar.xz \
    && mv naiveproxy-v120.0.6099.43-1-linux-x64/naive /usr/local/bin/naive \
    && chmod +x /usr/local/bin/naive \
    && rm -rf naiveproxy-v120.0.6099.43-1-linux-x64

COPY config.json /config.json

CMD ["naive", "/config.json"]

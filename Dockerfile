FROM alpine:latest

RUN apk add --no-cache wget ca-certificates xz

RUN NAIVE_VER=$(wget -qO- https://api.github.com/repos/klzgrad/naiveproxy/releases/latest \
        | grep '"tag_name"' | cut -d'"' -f4) \
    && wget -O naive.tar.xz \
        "https://github.com/klzgrad/naiveproxy/releases/download/${NAIVE_VER}/naiveproxy-${NAIVE_VER}-linux-x64.tar.xz" \
    && tar -xf naive.tar.xz \
    && rm naive.tar.xz \
    && mv "naiveproxy-${NAIVE_VER}-linux-x64/naive" /usr/local/bin/naive \
    && chmod +x /usr/local/bin/naive \
    && rm -rf "naiveproxy-${NAIVE_VER}-linux-x64"

COPY config.json /config.json

CMD ["naive", "/config.json"]

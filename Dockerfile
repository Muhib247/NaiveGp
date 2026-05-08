FROM alpine:latest
RUN apk add --no-cache wget ca-certificates
RUN wget -O naive.tar.xz https://github.com/klzgrad/naiveproxy/releases/download/v120.0.6099.43-1/naiveproxy-v120.0.6099.43-1-linux-x64.tar.xz && tar -xf naive.tar.xz && rm naive.tar.xz && chmod +x naive
COPY config.json /config.json
CMD ["./naive", "/config.json"]

FROM alpine:latest
RUN apk add --no-cache wget ca-certificates
RUN wget -O naive.tar.xz https://github.com/klzgrad/naiveproxy/releases/download/v148.0.7778.96-2/naiveproxy-v148.0.7778.96-2-linux-x64.tar.xz && tar -xf naive.tar.xz && rm naive.tar.xz && chmod +x naive
COPY config.json /config.json
CMD ["./naive", "/config.json"]

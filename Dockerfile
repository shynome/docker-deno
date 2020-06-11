FROM alpine as Build
ARG DENO_VERSION=v1.0.5
RUN set -xe \
    && wget -O deno.zip https://github.com/denoland/deno/releases/download/$DENO_VERSION/deno-x86_64-unknown-linux-gnu.zip \
    && unzip deno.zip
FROM debian:stable
COPY --from=Build /deno /usr/bin/deno
ENTRYPOINT [ "/usr/bin/deno" ]

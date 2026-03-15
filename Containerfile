ARG ALPINE_CHANNEL=edge
FROM alpine:${ALPINE_CHANNEL} AS build

ARG ALPINE_CHANNEL
ARG APP_VERSION=0.11.2-r0

RUN --mount=type=tmpfs,target=/extract_root/etc/apk \
    --mount=type=tmpfs,target=/extract_root/lib/apk \
    --mount=type=tmpfs,target=/extract_root/var <<EOF
apk add --no-cache --root /extract_root --initdb --keys-dir /etc/apk/keys \
    -X "http://dl-cdn.alpinelinux.org/alpine/${ALPINE_CHANNEL}/main" \
    -X "http://dl-cdn.alpinelinux.org/alpine/${ALPINE_CHANNEL}/testing" \
    amdgpu_top=${APP_VERSION}
EOF

FROM scratch

COPY --from=build /extract_root /

ENTRYPOINT [ "/usr/bin/amdgpu_top" ]

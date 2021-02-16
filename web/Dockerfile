FROM golang:1.14-alpine as builder
WORKDIR /usr/src/web
COPY ./web ./
RUN apk add --no-cache tzdata upx
RUN upx --best web -o _upx_web && \
mv -f _upx_web web

FROM scratch
WORKDIR /opt/web
COPY --from=builder /usr/src/web/web ./
COPY --from=builder /usr/share/zoneinfo/Asia/Shanghai /usr/share/zoneinfo/Asia/
ENV TZ=Asia/Shanghai
CMD ["./web"]
FROM golang:1.19.2-alpine as build-env
RUN go install -v github.com/projectdiscovery/notify/cmd/notify@latest

FROM alpine:latest
COPY --from=build-env /go/bin/notify /usr/local/bin/notify

ENTRYPOINT ["notify"]

FROM golang:alpine AS builder

WORKDIR $GOPATH/src/static-server/main
COPY static-server.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo \
    -ldflags "-s -w" \
    -o /static-server ./static-server.go

FROM scratch
COPY --from=builder /static-server /static-server
COPY site/ /site/

CMD ["/static-server"]

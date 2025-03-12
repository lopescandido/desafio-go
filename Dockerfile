FROM golang:alpine3.14 AS builder

WORKDIR /app

COPY main.go . 

RUN go build -o /main main.go


FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8000

ENTRYPOINT ["./main"]

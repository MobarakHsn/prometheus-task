FROM golang:alpine AS builder
RUN mkdir /prometheus-task
COPY . /prometheus-task
WORKDIR /prometheus-task
RUN go build .

FROM alpine
WORKDIR /prometheus-task
COPY --from=builder /prometheus-task /prometheus-task

ENTRYPOINT ["./prometheus-task", "start"]
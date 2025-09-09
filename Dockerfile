FROM golang:1.22-alpine AS builder
WORKDIR /app

COPY . .

RUN go mod init fullcycle && go mod tidy

RUN go build -ldflags="-s -w" -o fullcycle main.go

FROM scratch
COPY --from=builder /app/fullcycle /
CMD ["/fullcycle"]

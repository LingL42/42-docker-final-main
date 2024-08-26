FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

#RUN go build -o main .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app

COPY tracker.db /app/tracker.db

ENV DATABASE_URL /app/tracker.db

EXPOSE 8080

CMD ["/my_app"]


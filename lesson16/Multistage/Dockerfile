FROM golang:latest as build
COPY . .
RUN go build /go/main.go


FROM alpine:latest
COPY --from=build /go/main .
CMD ["./main"]
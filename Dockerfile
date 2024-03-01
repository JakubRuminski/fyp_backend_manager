FROM golang:1.22.0 AS build

WORKDIR /backend

RUN mkdir /logs

RUN go build -o /cobh .

FROM scratch AS production

COPY --from=build /cobh /cobh

ENTRYPOINT ["/cobh", "prepare"]
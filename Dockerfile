FROM golang AS firststage

RUN apt-get update && \
    apt-get install vim -y && \
    mkdir app 

WORKDIR /go/app

COPY ./hello-world.go .

RUN go build hello-world.go

FROM scratch

COPY --from=firststage /go/app/hello-world .

ENTRYPOINT ["./hello-world"]


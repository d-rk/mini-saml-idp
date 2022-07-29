FROM golang:1.18.0-alpine3.15 AS builder

WORKDIR /go/src/mini-saml-idp
COPY . .

RUN go get -d -v ./...
RUN export CGO_ENABLED=0 && go install -buildvcs=false -v ./...

WORKDIR /go/src/mini-saml-idp

FROM alpine AS runtime
COPY --from=builder /go/bin/mini-saml-idp /bin/mini-saml-idp

ENV IDP_BASE_URL http://localhost:9009
ENV SERVICE_METADATA_URL http://localhost:8080/saml/metadata
ENV USER_JSON /data/users.json

COPY users.json /data/users.json

CMD ["mini-saml-idp"]
#
#
#FROM scratch
#ENV IDP_BASE_URL http://localhost:9009
#ENV SERVICE_METADATA_URL http://localhost:8080/saml/metadata
#ENV USER_JSON /data/users.json
#
#CMD mkdir /app
#WORKDIR /app
#
#COPY samlidp /app
#COPY users.json /app/data
#
#ENTRYPOINT ["/app/samlidp"]
##--- FIRST STAGE ---## 
FROM alpine:latest

# CREATE TLS KEY AND CERT
RUN apk add openssl
RUN openssl req -x509 -newkey rsa:4096 -nodes -days 365 -keyout tls.key -out tls.crt -addext 'subjectAltName=IP:127.0.0.1' -subj '/O=HashiCorp/CN=Vaultish'
##-------------------##

##--- SECOND STAGE ---##
FROM hashicorp/vault

# SET UP CERTS
RUN mkdir /vault/tls && chown vault:vault /vault/tls
COPY --from=0 tls.key /vault/tls/tls.key
COPY --from=0 tls.crt /vault/tls/tls.crt
RUN chown vault:vault /vault/tls/*
RUN export VAULT_ADDR='https://127.0.0.1:8200' && export VAULT_CACERT='/vault/tls/tls.crt'

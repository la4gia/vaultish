# Full configuration options can be found at https://www.vaultproject.io/docs/configuration

# STORE IN /opt/vault ON HOST

ui = true
api_addr = "https://127.0.0.1:8000"

storage "file" {
  path = "/vault/config/data"
}

# HTTPS listener
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/vault/tls/tls.crt"
  tls_key_file  = "/vault/tls/tls.key"
}

# vaultish
TLS-enabled HashiCorp Vault docker container. Runs on localhost and uses persistant storage via file in /opt/vault (on host)

## Prerequisites
  1. Docker installed on host
  2. Vault installed on host
  3. vault.hcl stored in /opt/vault (template provided)

## Example Build and Run

```yaml
# from within directory with Dockerfile
# build image
docker build -t vaultish .

# run container
docker run -d --cap-add=IPC_LOCK --volume /opt/vault:/vault/config -p 8200:8200 vaultish server
```

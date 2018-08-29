# proxy-cert

https proxy with client certificate

`docker run -e S3_BUCKET=encrypted-please -e PROXY_TARGET_URL=my-secure-url.app.com fijimunkii/proxy-cert:latest`

## Local testing

* Pre-requisite: certs need to be manually added to `proxy-cert/cert`

`PROXY_TARGET_URL=my-secure-url.app.com node proxy-cert/index.js`

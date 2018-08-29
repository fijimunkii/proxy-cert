FROM node:10.9.0-slim

MAINTAINER Harrison Powers, harrisonpowers@gmail.com

RUN npm i -g pm2

RUN apt-get update && apt-get install -qq -y curl python-pip libpython-dev libnss3-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py \
  && pip install -q awscli --upgrade

ADD . /root/

WORKDIR /root

# proxy-cert dep
RUN cd proxy-cert && npm i

CMD bash proxy-cert/sync_cert.sh \
  && export CYPRESS_baseUrl=http://localhost:8000 \
  && pm2 start proxy-cert/index.js --name proxy-cert --wait-ready --no-daemon

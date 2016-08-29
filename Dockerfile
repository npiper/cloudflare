from golang:latest

# Install cfssl

## Instructions

## https://github.com/cloudflare/cfssl/blob/master/doc/bootstrap.txt

RUN go get -u github.com/cloudflare/cfssl/cmd/cfssl

RUN go get -u github.com/cloudflare/cfssl/cmd/mkbundle

RUN go get -u github.com/cloudflare/cfssl/cmd/cfssljson

# Set up the intermediate and Root certificate bundles

RUN mkdir -p /home/cloudflare
RUN mkdir -p /etc/cfssl

WORKDIR /home/cloudflare 

# Get certificate bundles
RUN git clone https://github.com/cloudflare/cfssl_trust

RUN cp /home/cloudflare/cfssl_trust/*.crt /etc/cfssl

COPY ca.json /etc/cfssl

RUN cfssl genkey -initca /etc/cfssl/ca.json | cfssljson -bare ca

EXPOSE 8888

# Start cfssl server - defaults to port 8888
CMD cfssl serve -loglevel 2



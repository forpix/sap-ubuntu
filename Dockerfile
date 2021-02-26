FROM alpine:3.9.3
LABEL maintainer "Ali mahammad.ali01@sap.com"
RUN apk --no-cache add \
        ca-certificates \
        curl
# Install SAP global certificates
ADD http://aia.pki.co.sap.com/aia/SAP%20Global%20Root%20CA.crt /usr/local/share/ca-certificates/SAP_Global_Root_CA.crt
RUN update-ca-certificates

RUN mkdir cf-cli
WORKDIR /cf-cli

# Download latest CF CLI
RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx

RUN cf --version

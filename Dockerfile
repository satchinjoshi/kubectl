FROM alpine/helm:3.7.1

ENV KUBE_VERSION="v1.22.4"

RUN apk add --update ca-certificates aws-cli jq \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

WORKDIR /root

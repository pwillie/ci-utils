FROM alpine:3.7

ENV HELM_LATEST_VERSION="v2.8.1"

RUN apk add --update ca-certificates curl git py-pip \
 && pip install awscli --upgrade \
 && curl -sS http://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz | \
    tar xvz --strip 1 -C /usr/local/bin linux-amd64/helm \
 && helm init --client-only


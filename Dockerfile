FROM alpine:3.7

ENV HELM_VERSION="v2.8.1"
ENV KUBE_VERSION="v1.9.3"

ENV KUBERNETES_SERVICE_HOST=kubernetes.default
ENV KUBERNETES_SERVICE_PORT=443

RUN apk add --update bash ca-certificates curl git py-pip \
 && pip install awscli --upgrade \
 && curl -sSLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && curl -sS http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | \
    tar xvz --strip 1 -C /usr/local/bin linux-amd64/helm \
 && helm init --client-only


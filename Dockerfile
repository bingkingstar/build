FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

LABEL version="1.0" \
      description="This is Dockerfile" \
      maintainer="Red Hat Training <training@redhat.com>"

USER root

RUN microdnf install -y python3 && \
    microdnf clean all && \
    mkdir -p /app && \
    echo "Hello container!" > /app/index.html

ENV DOCROOT=/app

ONBUILD COPY src/ ${DOCROOT}

EXPOSE 80

USER 1001

WORKDIR /app

CMD ["python3", "-m", "http.server", "80"]

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

LABEL version="1.0" \
      description="this is Dockerfile" \
      maintainer="Red Hat Training <training@redhat.com>"

USER root

RUN microdnf insta ll -y python3 && \
    microdnf clean all && \
    mkdir -p /app  && \
    echo "Hello container!" > /app/index.html

ENV DOCROOT=/app

ONBUILD COPY ${DOCROOT} src/
EXPOSE 8080

USER 1001

WORKDIR /app

CMD ["python3", "-m", "http.server", "8080"]

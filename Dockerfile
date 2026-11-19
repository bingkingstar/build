FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

LABEL version="1.0"
LABEL description="this is Dockerfile"
LABEL Red Hat Training <training@redhat.com>

USER root

<<<<<<< HEAD
RUN microdnf install -y python3
RUN microdnf clean all
RUN mkdir -p /app
RUN echo "Hello container!" > /app/index.html

ENV DOCROOT=/app

=======
RUN microdnf install -y python3 && \ 
    microdnf clean all && \
    mkdir -p /app && \
    echo "Hello container!" > /app/index.html

ENV DOCROOT=/app
ONBUILD COPY src/ ${DOCROOT}
>>>>>>> b807f86b425ef840619fa9b3c9bb1f5afee31282
EXPOSE 8080

USER 1001

WORKDIR /app

CMD ["python3", "-m", "http.server", "8080"]

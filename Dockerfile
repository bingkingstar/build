FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

<<<<<<< HEAD
LABEL version="1.0" \
      description="this is Dockerfile" \
      maintainer="Red Hat Training <training@redhat.com>"

USER root

RUN microdnf install -y python3 && \
    microdnf clean all  && \
    mkdir -p /app  && \
    echo "Hello container!" > /app/index.html

ENV DOCROOT=/app

ONBUILD COPY src/ ${DOCROOT}    

=======
LABEL version="1.0"
LABEL description="this is Dockerfile"
LABEL Red Hat Training <training@redhat.com>

USER root

RUN microdnf install -y python3
RUN microdnf clean all
RUN mkdir -p /app
RUN echo "Hello container!" > /app/index.html

ENV DOCROOT=/app

>>>>>>> 23417cb (test)
EXPOSE 8080

USER 1001

WORKDIR /app

CMD ["python3", "-m", "http.server", "8080"]

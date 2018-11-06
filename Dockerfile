FROM python:alpine

# Metadata params
ARG VERSION=0.1.0

# Metadata
LABEL maintainer="Mikhail Konyakhin <m.konyahin@gmail.com>" \
      org.label-schema.url="https://github.com/sportsru/gitlab-registry-images-cleaner/blob/master/README.md" \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-url="https://github.com/sportsru/gitlab-registry-images-cleaner.git" \
      org.label-schema.vcs-ref=$VERSION \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.description="Gitlab Registry Images Cleaner on alpine docker image" \
      org.label-schema.schema-version="1.0"

COPY requirements.txt /
COPY gricleaner.py /

RUN pip install --upgrade -r requirements.txt

ENTRYPOINT ["./gricleaner.py"]

CMD ["-h"]

FROM docker.io/python:3.12-alpine AS production

WORKDIR /srv

ENV PYTHONUNBUFFERED=1

CMD [ "/usr/local/bin/uvicorn", "--host", "0.0.0.0", "skel.main:app" ]

RUN adduser -D -h /srv srv && \
  chown -R srv: /srv && \
  apk add --no-cache py3-pip && \
  rm -Rf /var/cache/apk/*

COPY ./requirements.txt /srv/

RUN pip install --no-cache-dir --requirement /srv/requirements.txt

USER srv

COPY --chown=srv:srv ./skel /srv/skel


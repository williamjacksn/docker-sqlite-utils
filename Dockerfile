FROM python:3.10.7-alpine3.16

LABEL org.opencontainers.image.source="https://github.com/williamjacksn/docker-sqlite-utils"

RUN /usr/sbin/adduser -g python -D python

USER python
RUN /usr/local/bin/python -m venv /home/python/venv

ENV PATH="/home/python/venv/bin:${PATH}" \
    PYTHONDONTWRITEBYTECODE="1" \
    PYTHONUNBUFFERED="1"

WORKDIR /home/python/docker-sqlite-utils

COPY --chown=python:python requirements.txt /home/python/docker-sqlite-utils/requirements.txt
RUN /home/python/venv/bin/pip install --no-cache-dir --requirement /home/python/docker-sqlite-utils/requirements.txt

ENTRYPOINT ["/home/python/venv/bin/sqlite-utils"]

FROM python:3.8-slim

ARG USERID=1000
ARG GROUPID=1000
ARG USER=jenkins
ARG GROUP=jenkins

RUN set -x && \
    groupadd -g ${GROUPID} ${GROUP} && \
    useradd -M -N -s /bin/bash -u ${USERID} -g ${GROUPID} ${USER}

WORKDIR /home/${USER}
RUN set -x && \
    chmod 755 . && \
    mkdir -p .ssh && \
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> .ssh/config && \
    chmod 600 .ssh/config && \
    chown -R ${USER}:${GROUP} .

RUN pip install python-gilt && \
    rm -rf /root/.cache/pip


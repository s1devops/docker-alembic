FROM dockerfile/ubuntu

RUN \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y python3 python3-pip build-essential python3-dev libpq-dev && \
    rm -rf /var/lib/apt/lists/*


ADD requirements.txt /srv/app/requirements.txt
RUN pip3 install -r /srv/app/requirements.txt

WORKDIR /usr/src/app

ENTRYPOINT ["alembic"]
CMD ["--help"]
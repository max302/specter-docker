FROM debian:buster-slim
LABEL version="0.8.1"


ENV BITCOIN_DATA /data
ENV SPECTER_DATA /root/.specter
ENV SPECTER_VERSION 0.8.1
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /usr/src/app

VOLUME /root/.specter
VOLUME /data

COPY config.json /root/.specter/

RUN apt-get update && apt-get upgrade -y wget libusb-1.0-0
RUN wget https://github.com/cryptoadvance/specter-desktop/releases/download/v0.8.1/specterd-v0.8.1-x86_64-linux-gnu.tar.gz
RUN tar -xzvf specterd-v0.8.1-x86_64-linux-gnu.tar.gz

EXPOSE 25441/TCP

CMD /usr/src/app/release/specterd-v0.8.1-x86_64-linux-gnu/specterd --host 0.0.0.0

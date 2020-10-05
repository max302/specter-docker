LABEL version="0.8.1"

ENV BITCOIN_DATA /data
ENV SPECTER_DATA /root/.specter
ENV SPECTER_VERSION 0.8.1

FROM python:3

WORKDIR /usr/src/app

VOLUME /root/.specter
VOLUME /data

#COPY requirements.txt ./
RUN pip3 install cryptoadvance.specter==0.8.1

COPY . .

EXPOSE 25441/TCP

CMD [ "python3", "-m cryptoadvance.specter server --daemon" ]

FROM python:3.11-alpine

RUN apk add --no-cache git

ENV BASE_URL=https://thepiratebay.org/

COPY requirements.txt requirements.txt

RUN apk add --no-cache libxml2-dev libxml2 g++ gcc libxslt-dev && \
    pip3 install --upgrade pip && \
    pip3 install -r ./requirements.txt


WORKDIR /opt

RUN mkdir -p thepiratebay
WORKDIR /opt/thepiratebay

COPY . .

RUN ["chmod", "+x", "entrypoint.sh"]

ENTRYPOINT ["./entrypoint.sh"]

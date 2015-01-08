FROM barnybug/openjdk-7-jre

ENV ES_VERSION 0.20.5

# install wget
RUN apt-get install -y wget && apt-get clean

# download and unpack elasticsearch
RUN wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz -O - | tar zxvf - && \
    mv /elasticsearch-$ES_VERSION /elasticsearch

ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

VOLUME ["/data", "/logs"]

EXPOSE 9200 9300
CMD ["elasticsearch/bin/elasticsearch", "-f"]

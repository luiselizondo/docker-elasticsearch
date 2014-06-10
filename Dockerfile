FROM dockerfile/java
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install ElasticSearch.
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.tar.gz && \
  tar xvzf elasticsearch-1.2.1.tar.gz && \
  rm -f elasticsearch-1.2.1.tar.gz && \
  mv /tmp/elasticsearch-1.2.1 /elasticsearch

RUN mkdir -p /var/log/supervisor
ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD ./config/elasticsearch.yml /etc/elasticsearch.yml

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

CMD ["/usr/bin/supervisord", "-n"]
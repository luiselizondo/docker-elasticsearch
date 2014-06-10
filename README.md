## ElasticSearch Dockerfile

This repository contains **Dockerfile** of [ElasticSearch](http://www.elasticsearch.org/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/dockerfile/elasticsearch/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [dockerfile/java](http://dockerfile.github.io/#/java)

### Installation
  
    docker build -t="luis/elasticsearch" luis/elasticsearch

### Usage

Create a volume-only container to persist the data:

    docker run -v /data --name ELASTICSEARCH busybox true

Run the container:

    docker run -d -p 9200:9200 -p 9300:9300 --volumes-from=ELASTICSEARCH luis/elasticsearch

Alternatively, you can use volumes to persist data:

    docker run -d -v /var/elasticsearch:/data -p 9200:9200 -p 9300:9300 luis/elasticsearch

Open `http://<host>:9200` to see the result.

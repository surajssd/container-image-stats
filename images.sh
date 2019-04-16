#!/bin/bash

declare -a image_keys=(
  "nginx"
  "jenkins"
  "couchbase"
  "mongo"
  "redis"
  "postgres"
  "mysql"
  "httpd"
  "node"
  "traefik"
  "arangodb"
  "memcached"
  "zookeeper"
  "prometheus"
  "registry"
  "mariadb"
  "consul"
  "rabbitmq"
  "elasticsearch"
  "influxdb"
  "tomcat"
  "orientdb"
  "irssi"
  "notary"
  "celery"
  "storm"
  "haproxy"
  "wordpress"
  "crate"
  "telegraf"
  "sonarqube"
  "ghost"
  "kafka"
  "kong"
  "nextcloud"
  "kibana"
  "grafana"
  "cassandra"
  "gradle"
  "drupal"
  "vault"
  "logstash"
  "eclipse-mosquitto"
  "solr"
  "owncloud"
  "percona"
  "nats"
  "buildpack"
  "rocket"
  "chronograf"
  "jruby"
  "couchdb"
  "flink"
  "joomla"
  "jetty"
  "rethinkdb"
  "redmine"
  "django"
  "flask"
  "mattermost"
  "gitlab"
  "sqid"
  "ambassador"
  "contour"
  "circleci"
  "drone"
  "gogs"
  "rancher"
  "openshift"
  "apache"
  "spark"
  "sentry"
)

images=""
for keyword in "${image_keys[@]}"; do
  echo "Processing keyword ${keyword} ..."
  # search for official images of each keyboard
  curr_image=$(docker search --filter "is-official=true" --format "{{.Name}}" "${keyword}")
  images="$images $curr_image"
done

# this will store image-name=uid key value pair
uids=""

# iterate over all the images and find what is the user defind for that image
for image in $images; do
  echo "Processing image ${image} ..."
  docker pull "${image}"
  uid=$(docker inspect "${image}" | jq '.[].ContainerConfig.User')
  uids="$uids $image=$uid"
done

# clean up after data collection
for image in $images: do
  docker rmi "${image}"
done

echo "================================"
for uid in $uids; do
  echo "$uid"
done

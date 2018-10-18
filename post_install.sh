#!/usr/bin/env bash
url="http://0.0.0.0:5601"
index_pattern="twitter-*"
id=$(curl -f -XPOST -H "Content-Type: application/json" -H "kbn-xsrf: anything" \
  "$url/api/saved_objects/index-pattern" \
  -d"{\"attributes\":{\"title\":\"$index_pattern\"}}" \
  | jq -r '.id')
curl -XPOST -H "Content-Type: application/json" -H "kbn-xsrf: anything" \
  "$url/api/kibana/settings/defaultIndex" \
  -d"{\"value\":\"$id\"}"

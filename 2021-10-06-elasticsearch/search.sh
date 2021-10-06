#!/bin/bash

search_file=${1:?Please specify the file containing the search}

curl -XPOST "http://localhost:9200/my_index/_search" -H 'Content-type: application/json' -d "@${search_file}" | jq


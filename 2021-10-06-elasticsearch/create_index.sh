#!/bin/bash

index_file=${1:?Please specify the file containing the index definition}

curl -XDELETE "http://localhost:9200/my_index"
curl -XPUT "http://localhost:9200/my_index" -H 'Content-type: application/json' -d "@${index_file}" | jq


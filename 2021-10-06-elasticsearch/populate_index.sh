#!/bin/bash

files=$(ls docs/*.txt)

for file in $files; do
  file_id=${file#*/}
  curl -XDELETE "http://localhost:9200/my_index/_doc/${file_id}"
  curl -XPOST "http://localhost:9200/my_index/_create/${file_id}" -H 'Content-type: application/json' -d "{\"contents\":\"$(cat "$file")\"}" | jq
done


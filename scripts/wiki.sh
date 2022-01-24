#! /bin/bash

q="$*"
q=( $q )
query=${q[@]^}

query=$(echo $query | awk 'BEGIN { OFS = "_"; } {$1=$1;print $0}';)

URL="https://en.wikipedia.org/api/rest_v1/page/summary/${query}"

UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36"

res=$(curl -s -A "$UA" "$URL")

desc=$(echo $res | jq -r .extract)

echo $desc

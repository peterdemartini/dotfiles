function es-delete-indices --description 'Interactively delete elasticsearch indices'
  curl -sfS 'localhost:9200/_cat/indices?v' \
    | tail -n +2 \
    | awk '{print $3}' \
    | sort \
    | fzf --multi \
    | awk '{ printf "localhost:9200\/%s\n", $1 }' \
    | xargs curl -XDELETE
end

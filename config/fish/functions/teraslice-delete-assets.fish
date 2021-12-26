function teraslice-delete-assets --description 'Interactively delete teraslice assets'
  curl -sSf localhost:5678/txt/assets \
    | tail -n+3 \
    | fzf --multi \
    | awk '{printf "http://localhost:5678/assets/%s\n", $3}' \
    | xargs curl -XDELETE
end

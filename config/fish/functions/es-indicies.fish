function es-indicies --description 'List the elasticsearch indicies'
    set es_port '9200'
    set grep_query ''

    argu p:: port:: -- $argv | while read -l opt value
        switch $opt
        case -p --port
            set es_port "$value"
        case _
            set grep_query "$value"
        end
    end

    set es_uri "http://localhost:$es_port/_cat/indices?v&h=index,heath,pri,rep,docs.count"

    if test $grep_query = ''
        curl -sSf "$es_uri"
    else
        curl -sSf "$es_uri" | head -n 1
        curl -sSf "$es_uri" | grep --color=always "$grep_query"
    end
end

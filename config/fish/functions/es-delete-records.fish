function es-delete-records --description 'Delete records from an index'
    set es_port '9200'
    set es_index ''
    set es_query '*'

    argu p:: port:: q: query: -- $argv | while read -l opt value
        switch $opt
        case -p --port
            set es_port "$value"
        case -q --query
            set es_query "$value"
        case _
            set es_index "$value"
        end
    end

    if test $es_index = ""
        echo "* Missing index as last arg"
        return 1
    end

    curl -sSf -XPOST "localhost:9200/$es_index/_delete_by_query?q=$es_query"
end

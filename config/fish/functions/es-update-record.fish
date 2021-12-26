function es-update-record --description 'Update a record (partial)'
    set es_port '9200'
    set es_index ''
    set es_type '_doc'
    set doc ''
    set record_id ''

    argu p:: port:: id:: t:: type:: i:: index:: -- $argv | while read -l opt value
        switch $opt
        case -p --port
            set es_port "$value"
        case --id
            set record_id "$value"
        case -t --type
            set es_type "$value"
        case -i --index
            set es_index "$value"
        case _
            set doc "$value"
        end
    end

    if test $es_index = ""
        echo "* Missing --index arg"
        return 1
    end
    if test $record_id = ""
        echo "* Missing --id arg"
        return 1
    end
    if test $doc = ""
        echo "* Missing partial update document as last arg"
        return 1
    end

    curl -sSf -XPOST \
        "localhost:9200/$es_index/$es_type/$record_id/_update?pretty" \
        -H 'Content-Type: application/json' \
        -d "{ \"doc\": $doc }"
end

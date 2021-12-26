function es-search --description 'Search elasticsearch'
    set es_port '9200'
    set es_index ''
    set es_query '*'
    set es_size '100'
    set use_xlucene 'false'
    set type_config '{}'

    argu x p:: port:: type-config:: q: query: s:: size:: -- $argv | while read -l opt value
        switch $opt
        case -p --port
            set es_port "$value"
        case -q --query
            set es_query "$value"
        case -s --size
            set es_size "$value"
        case -x
            set use_xlucene 'true'
        case --type-config
            set type_config "$value"
        case _
            set es_index "$value"
        end
    end

    if test $es_index = ""
        echo "* Missing index as last arg"
        return 1
    end

    set jq_filter '{ results: .hits.hits, total: .hits.total, returning: .hits.hits | length }'

    if test "$use_xlucene" = "true"
        set -l translated_body (node -e "
            const { Translator } = require('$HOME/Projects/teraslice/packages/xlucene-translator');
            const result = new Translator(`$es_query`, {
                type_config: $type_config
            }).toElasticsearchDSL();
            result.size = $es_size;
            console.log(JSON.stringify(result));
        ")

        set -l request_uri "http://localhost:$es_port/$es_index/_search"
        echo "$request_uri $translated_body" 1>&2
        curl -sSf -d "$translated_body"  -H 'Content-Type: application/json' "$request_uri" | jq -Mr "$jq_filter"
    else
        set -l es_query_encoded (node -e "console.log(encodeURIComponent('$es_query'))")
        set -l request_uri "http://localhost:$es_port/$es_index/_search?q=$es_query_encoded&size=$es_size"
        echo "$request_uri" 1>&2
        curl -sSf "$request_uri" | jq -Mr "$jq_filter"
    end
end

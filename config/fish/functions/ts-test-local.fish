function ts-test-local --description 'Run test in debug mode with local services'
    set -x USE_EXISTING_SERVICES 'true'
    set -x ELASTICSEARCH_HOSTNAME 'localhost' 
    set -x ELASTICSEARCH_PORT '9200'
    set -x KAFKA_HOSTNAME 'localhost'
    set -x KAFKA_PORT '9092' 

    yarn test:debug $argv
end

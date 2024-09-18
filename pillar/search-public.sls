search:
    api:
        url: ''
        requests_batch: 10

    aws:
        endpoint: null

    opensearch:
        servers: http://localhost:9201
        logging: false
        force_sync: false

    gearman:
        servers: 127.0.0.1
        # deprecated and is now found in elife.gearman.db
        db:
            name: gearman
            #username:
            #password:

    debug: false
    validate: false
    ttl: 300
    rate_limit_minimum_page: 2

    {% import_yaml "era-articles.yaml" as era_articles %}
    era_articles: {{ era_articles|yaml }}
    rds_articles: {{ era_articles|yaml }}

    reviewed_preprints: {}

elife:
    php:
        max_children: 16
    webserver:
        app: caddy

    composer:
        version: 2.2.7

    gearman:
        persistent: True

    aws: {}
        #access_key_id:
        #secret_access_key:

    multiservice:
        services:
            search-gearman-worker:
                service_template: search-gearman-worker-service
                num_processes: 1
            search-queue-watch:
                service_template: search-queue-watch-service
                num_processes: 1

api_dummy:
    standalone: False
    pinned_revision_file: /srv/search/api-dummy.sha1

search:
    api:
        url: ''
        requests_batch: 10

    aws:
        endpoint: null

    elasticsearch:
        servers: http://localhost:9200 
        logging: false
        force_sync: false

    gearman:
        servers: localhost
        # deprecated and is now found in elife.gearman.db
        db:
            name: gearman
            #username:
            #password:

    debug: false
    validate: false
    ttl: 300
    rate_limit_minimum_page: 2


elife:
    gearman:
        persistent: True

    aws: {}
        #access_key_id:
        #secret_access_key:

    multiservice:
        services:
            search-gearman-worker:
                service_template: search-gearman-worker-service
                num_processes: 3
            search-queue-watch:
                service_template: search-queue-watch-service
                num_processes: 3

api_dummy:
    standalone: False
    pinned_revision_file: /srv/search/api-dummy.sha1

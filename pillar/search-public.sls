search:
    gearman:
        # deprecated and is now found in elife.gearman.db
        db:
            name: gearman
            #username:
            #password:

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

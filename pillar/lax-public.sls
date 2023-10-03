lax:
    app:
        # secret: 
        allow_invalid_ajson: True
        reporting_bucket: elife-lax-reports
        cache_headers_ttl: 300
        merge_foreign_fragments: True
        users:
            api_gateway:
                username: api-gateway
                # password: 

    # deprecated. use elife.db.app and elife.postgresql-12
    db:
        name: lax
        # username: 
        # password: 
        host: 127.0.0.1
        port: 5432

    glencoe:
        cache_requests: True # default behaviour is to cache requests

    aws:
        # access_key_id:
        # secret_access_key:
        subscriber: 512686554592
        region: us-east-1

    sns:
        name: bus-articles
        subscriber: 512686554592 # TODO: remove in favor or pillar.lax.aws
        region: us-east-1 # TODO: remove in favor of pillar.lax.aws

    restore:
        db: lax/201706/20170605_prod--lax.elifesciences.org_230109-laxprod-psql.gz

    botlax:
        api:
            url:

elife:
    db:
        app:
            name: lax
            # username:
            # password:

    loris:
        storage: /ext/loris
        port: 8010
        resolver:
            impl: loris.resolver.SimpleHTTPResolver
            source_prefix: https://publishing-cdn.elifesciences.org/

    uwsgi:
        services:
            lax:
                folder: /srv/lax

    multiservice:
        services:
            bot-lax-adaptor:
                service_template: bot-lax-adaptor-service
                num_processes: 1

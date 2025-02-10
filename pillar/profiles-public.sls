profiles:
    orcid:
        # sandbox parameters by default
        api_uri: https://api.sandbox.orcid.org
        authorize_uri: https://sandbox.orcid.org/oauth/authorize
        token_uri: https://sandbox.orcid.org/oauth/token
        # sandbox.orcid.org credentials
        # client_id:
        # client_secret:
        # read_public_access_token:
        # webhook_access_token:
        # webhook_key:
    default_host: ci--profiles.elifesciences.org
    default_scheme: https
    db:
        name: profiles
        username: profiles
        # password:
        host: host.docker.internal #127.0.0.1
        port: 5432
    logging:
        level: DEBUG
    orcid_dummy:
        pinned_revision_file: /srv/profiles/orcid-dummy.sha1
    sns:
        name: bus-profiles
        subscriber: 512686554592
        region: us-east-1
    consumer_groups_filter:
        api_gateway:
            username: api-gateway
            # password:

elife:
    webserver:
        app: caddy
        auto_https: true

    aws: {}
        # `profiles` IAM user
        # access_key_id:
        # secret_access_key:
    sidecars:
        main: elifesciences/profiles
        containers:
            orcid_dummy:
                name: orcid-dummy
                image: elifesciences/orcid-dummy
                port: 8001
                enabled: false

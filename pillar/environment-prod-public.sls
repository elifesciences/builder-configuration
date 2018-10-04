elife:
    env: prod

elife_xpub:
    api:
        endpoint: https://xpub.elifesciences.org
    orcid:
        sandbox: false
        # client_id:
        # client_secret:
    pubsweet:
        base_url: https://xpub.elifesciences.org
    s3:
        bucket: prod-elife-xpub
    deployment_target: prod

journal:
    feature_xpub: false
    submit_url: http://submit.elifesciences.org/
    #submit_url: https://xpub.elifesciences.org/login

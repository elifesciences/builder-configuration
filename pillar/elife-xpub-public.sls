elife_xpub:
    api:
        endpoint: https://ci--xpub.elifesciences.org
    database:
        # user: 
        # password: 
        email: it-admin@elifesciences.org
        collection: xpub
    ink:
        # user: 
        # password: 
        endpoint: http://54.157.211.94:3000
    orcid:
        sandbox: true
        client_id: fake_client_id # overwritten by environment
        client_secret: fake_client_secret # overwritten by environment
    pubsweet:
        base_url: https://ci--xpub.elifesciences.org
    meca:
        sftp:
            connection:
                host: ''
                port: 22
                username: ''
                password: ''
            remote_path: '' 
    s3:
        bucket: ci-elife-xpub # does not really exist, overwritten by environment
    deployment_target: ci # still on port 3000

elife:
    aws:
        # `elife-xpub` IAM user
        # access_key_id:
        # secret_access_key:
        region: us-east-1

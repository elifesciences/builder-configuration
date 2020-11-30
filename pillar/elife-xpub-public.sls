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
    mailer:
        # by default no mail can be sent
        host:
        port:
        user:
        pass:
    deployment_target: formula # still on port 3000

elife:
    aws:
        # `elife-xpub` IAM user
        # access_key_id:
        # secret_access_key:
        region: us-east-1
    docker:
        prune_days: 1
    # only used in testing environments
    sidecars:
        containers:
            sftp:
                name: sftp
                image: elifesciences/sftp
                tag: 20190110
                command: ejpdummy:ejpdummy:::meca
                ports:
                    # SSH/SFTP
                    - "2222:22"
                enabled: false

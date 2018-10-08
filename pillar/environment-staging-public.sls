elife:
    env: staging

elife_xpub:
    api:
        endpoint: https://staging--xpub.elifesciences.org
    orcid: {}
        # sandbox.orcid.org credentials
        # client_id:
        # client_secret:
    pubsweet:
        base_url: https://staging--xpub.elifesciences.org
    meca:
		sftp:
            connection:
                host: sftp.ejpress.com
				# EJP sandbox credentials
                # username: 
                # password:
    s3:
        bucket: staging-elife-xpub
    deployment_target: staging

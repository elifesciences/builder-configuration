elife:
    env: staging

elife_xpub:
    api:
        endpoint: https://staging--xpub.elifesciences.org
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
    mailer:
        host: email-smtp.us-east-1.amazonaws.com
        port: 587
        # `ses-smtp-user.elife-xpub` IAM user
        # see https://docs.aws.amazon.com/ses/latest/DeveloperGuide/smtp-credentials.html for explanations, but it's easier to create a new user than to derive its SMTP credentials from the AWS ones
        # user:
        # pass:
    deployment_target: staging

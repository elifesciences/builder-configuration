elife:
    answer: 42

    uwsgi:
        username: www-data

    ssh_credentials: {}
        # populate for single projects, `private_key` references must point
        # to files in builder-private
        #some_identifier:
        #    username: ubuntu
        #    home: /home/ubuntu
        #    private_key: salt://elife/ssh-credentials/sample.id_rsa

    # see builder-private
    ssh_users: {}

    ssh_access:
        # see builder-private
        allowed: {}
        denied: {}
        allowed_masterless: {}
        denied_masterless: {}

    composer:
        version: 2.2

    docker:
        # username:
        # password:
        prune_days: 14

    sidecars:
        # main image that will be used to extract labels
        # indicating metadata about the sidecars such as their own tags
        # main: elifesciences/annotations_cli
        containers: {}
            #api_dummy:
            #    image: elifesciences/api-dummy
            #    name: api-dummy
            #    port: 8001
            #    enabled: True

    eks:
        clusters: {}
            # lsh@2022-02-18: disabled, kubernetes-aws--test has been deleted
            #kubernetes-aws--test:
            #    region: us-east-1
            #    role: arn:aws:iam::512686554592:role/kubernetes-aws--test--AmazonEKSUserRole

    mockserver:
        expectations: {}
            #elife_bot: salt://elife-bot/config/mockserver.sh

    nginx_public_folders: []

    helm:
        username: elife

    webserver:
        auto_https: false

    php: {}

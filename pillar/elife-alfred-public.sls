alfred:
    builder:
        aws:
            region: us-east-1
    vault:
        addr: https://master-server.elifesciences.org:8200
        # see builder-private:
        #role_id:
        #secret_id:

elife:
    webserver:
        app: caddy
        auto_https: true
    helm:
        username: jenkins
    kubectl:
        username: jenkins

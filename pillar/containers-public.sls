containers:
    vault:
        addr: https://master-server.elifesciences.org:8200

elife:
    aws: {}
        #access_key_id: 
        #secret_access_key: 
    coveralls:
        tokens: {}
            # profiles: 
    ssh_credentials:
        ubuntu:
            username: ubuntu
            home: /home/ubuntu
            private_key: salt://elife/ssh-credentials/elife-alfred-user.id_rsa

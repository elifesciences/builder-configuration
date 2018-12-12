containers:
    vault:
        addr: https://master-server.elifesciences.org:8200
        role_id: 95ae571d-dc22-2956-6ceb-1082d10813ee

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

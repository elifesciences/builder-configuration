elife:
    nginx_public_folders:
        - meca
    sidecars:
        containers:
            sftp:
                volumes:
                    - "/var/nginx-public-folders/meca:/home/ejpdummy/meca"
                enabled: true

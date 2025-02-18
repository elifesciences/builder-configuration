elife:
    sidecars:
        containers:
            sftp:
                name: sftp
                image: elifesciences/sftp
                tag: 20190110
                command: myuser:mypassword:::myfolder
                ports:
                    - "2222:22"
                enabled: true
    php:
        version: '7.4'
        fpm: true

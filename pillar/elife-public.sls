elife:
    answer: 42

    ssh_credentials: {}
        # populate for single projects, `private_key` references must point
        # to files in builder-private
        #some_identifier:
        #    username: ubuntu
        #    home: /home/ubuntu
        #    private_key: salt://elife/ssh-credentials/sample.id_rsa

    ssh_users:
        # username: pubkey
        peterhooper: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaQaYnpDAaSNkDfuompmMmthxiuqmV8RcDLrfEzQQ8sXrrwxIJyUmO0bhijePxLoOHMZdSz8NcAl2FGYIqWU4bpWpWIhFFUjGBSlN/KjYAhd1eUI+O24JOPPAi5+eInyHS5OJKmqg0MKq6LMbU3zHSFFZdKEfrkECv058X7qtkoMgU7KMtjy9OQZrrA5mWePuTKFrSWV+5Vxhna2L3odURO0ApzqyqsT9jyyTrOl2MFl4c0mFPzdJhZqqa4gjX/eikp8y4cM8C5j3rPvdrxArdTiN2PIuzPDOVYN/2nt8X8tmzTFVfM2/PxdlKINjppjimQH+L0CnpEwhA9IVMBoEF
        hem: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7gyp8ERD/f3amztI4qVx5oMOU6CrutIhjNrBvXwf98wBOlHvb2bIV72wAplFqrxu8MRrXnNfh0NGT9LkjxQ4E+VKPdDF77jgOPBtrOOwwpGSjzrf/oOHa0bi+ma2Y0bWNQ1WadNPpGdc1L8MMdiB3Hzw3zbLc9AY0biimlHxeWL8T+IhpBmJkT/LKXoMBurOZX/ZbWPzUGkmvqLZrMgqMpM8eOF5JjYmjkwfCKwmBr72AMq4npEOGpgJjO4OlozlbN4yh0BL5CnFDBQrFvMczUbH9JXq5ap1eljYsVaP/bfaV8RzM1OFzORIigrfGGueQsJtuNq+YoEdw6o24SzL7
        tamlyn: ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAmt3C4g/LHecU33xkMCeqzQf4f9VRjRcxCY/GDIl9jwHsJifaAFlfor9xt+i4zz9lCZc8jTcUOH5DikDc3lw0LL7R9cE9i6aedoSb+pWVTBOSSGJIBh6XBWMrnnYYqINIQJIAPGzUn6j9Lceks/2aBn7+U6H5TrwAcZIr8jnK2Is=

    # grants known users remote access to project systems
    ssh_access:
        # ssh access is granted to the vagrant/ubuntu (bootstrap user) as well as 
        # the deploy user (elife).
        also_bootstrap_user: True
        # adds keys to deploy user's `~/.ssh/authorized_keys` file
        allowed:
            # per-user access to all instances
            all:
                - luke
                - luke_desktop
                - giorgio
                - chris

            # per-user, per-project access
            elife-xpub:
                - alfred
                - tamlyn
                - hem
                - peterhooper

    docker:
        # username:
        # password:
        prune_days: 14

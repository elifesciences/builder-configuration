elife:
    external_volume:
        directory: /bot-tmp

elife_bot:
    gcp:
        # will be overridden in Vault
        credentials_json: ''

    profiling:
        env_list:
            - dev
            - ci
            - end2end
            - continuumtest
            #- prod

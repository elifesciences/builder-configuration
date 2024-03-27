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
            # disabled, elife-bot tests run with both profiling on and off.
            # this can be removed once the centralised boto connection feature goes to prod
            #- ci
            - end2end
            - continuumtest
            - prod

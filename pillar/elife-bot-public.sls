elife:
    external_volume:
        directory: /bot-tmp

    profiling:
        env_list:
            - dev
            - continuumtest
        processes:
            worker:
                args: "--memory --no-browser --json --outfile /tmp/worker.scalene.json"

elife_bot:
    gcp:
        # will be overridden in Vault
        credentials_json: ''

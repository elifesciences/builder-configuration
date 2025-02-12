master_server:
    vault:
        dependent_projects:
            - basebox
            - elife-bot
elife:
    webserver:
        app: caddy
        auto_https: true

journal_cms:
    db:
        name: elife_2_0
        # user: 
        # password: 

    logs:
        file_path: private://monolog/

    files:
        private_path: ./../private

    journal:
        base_uri: null
        preview_uri: null

    aws:
        # access_key_id: 
        # secret_access_key: 
        region: us-east-1
        queue: journal-cms--ci
        endpoint: null
        topic_template: arn:aws:sns:us-east-1:512686554592:bus-%s--ci

    iiif:
        base_uri: null
        mount: iiif

    api:
        gateway: null
        articles_endpoint_for_migration: null
        articles_endpoint: null
        metrics_endpoint: null
        all_articles_endpoint: null
        all_digests_endpoint: null
        article_fragments_endpoint: null
        # auth_unpublished: 

    users:
        alfred:
            email: alfred@elifesciences.org
            # password: 
            role: administrator

    consumer_groups_filter:
        api_gateway:
            username: api-gateway
            # password:

    # backup to be restored on testing instances (end2end only)
    restore:
        files: journal-cms/201705/20170522_prod--journal-cms.elifesciences.org_230509-archive-b47198f6.tar.gz
        db: journal-cms/201705/20170522_prod--journal-cms.elifesciences.org_230506-elife_2_0-mysql.gz

elife:
    php:
        memory_limit: 128M
        upload_max_filesize: 32M
        post_max_size: 32M

    composer:
        version: 2.3.5

data_pipeline:
    nifi:
        aws_access_name: data-pipeline
        # aws_access_key:
        # aws_secret_access_key:

        # keystore_password:
        # key_password:

        oidc: {}
            # client_id:
            # client_secret:

        sensitive_props: {}
            # key:
            # algorithm:
            # provider:

    nifi_registry: {}
        # keystore_password:
        # key_password:

    bigquery_views:
        revision: latest
        materialize_arguments: '--disable-view-name-mapping'

elife:
    swap:
        path: /ext/swap.1

    web_users:
        nifi-registry-: {} # trailing hyphen not a typo
            # username:
            # password:

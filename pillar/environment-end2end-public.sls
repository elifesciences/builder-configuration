elife:
    env: end2end

{% set journal_cms_url = 'https://end2end--journal-cms.elifesciences.org' %}
{% set journal_url = 'https://end2end--journal.elifesciences.org' %}
{% set medium_url = 'http://end2end--medium.elife.internal' %}
{% set search_url = 'http://end2end--search.elife.internal' %}
{% set recommendations_url = 'http://end2end--recommendations.elife.internal' %}
{% set gateway_url_public = 'https://end2end--cdn-gateway.elifesciences.org' %}
{% set gateway_url_internal = 'http://end2end--gateway.elife.internal' %}
{% set gateway_url_for_migration = 'https://prod--gateway.elifesciences.org' %}
{% set lax_url = 'https://end2end--lax.elifesciences.org' %}
{% set metrics_url = 'http://end2end--metrics.elife.internal' %}
{% set profiles_url = 'http://end2end--profiles.elife.internal' %}
{% set annotations_url = 'http://end2end--annotations.elife.internal' %}
{% set digests_url = 'http://end2end--digests.elife.internal' %}
{% set iiif_url = 'https://end2end--cdn-iiif.elifesciences.org' %}

elife_xpub:
    api:
        endpoint: https://end2end--xpub.elifesciences.org
    pubsweet:
        base_url: https://end2end--xpub.elifesciences.org
    meca:
        sftp:
            connection:
                host: end2end--xpub--1.elife.internal
                port: 2222
                # fake FTP server credentials
                username: ejpdummy
                password: ejpdummy
            remote_path: 'meca/'
    s3:
        bucket: end2end-elife-xpub
    deployment_target: end2end

journal:
    feature_xpub: true
    submit_url: https://end2end--xpub.elifesciences.org/login

journal_cms:
    aws:
        queue: journal-cms--end2end
        topic_template: arn:aws:sns:us-east-1:512686554592:bus-%s--end2end
    journal:
        base_uri: {{ journal_url }}
    iiif:
        base_uri: "{{ iiif_url }}/journal-cms/"
        mount: iiif
    api:
        gateway: {{ gateway_url_internal }}
        articles_endpoint_for_migration: {{ gateway_url_for_migration }}/articles/%s/versions
        articles_endpoint: {{ gateway_url_internal }}/articles/%s/versions
        metrics_endpoint: {{ gateway_url_internal }}/metrics/article/%s/%s
        all_articles_endpoint: {{ gateway_url_internal }}/articles
        all_digests_endpoint: {{ gateway_url_internal }}/digests
        article_fragment_images_endpoint: {{ gateway_url_internal }}/articles/%s/fragments/image

lax:
    glencoe:
        cache_requests: False

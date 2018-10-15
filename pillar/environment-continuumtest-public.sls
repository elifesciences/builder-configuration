elife:
    env: continuumtest

{% set journal_url = 'https://continuumtest--journal.elifesciences.org' %}
{% set journal_preview_url = 'https://continuumtestpreview--journal.elifesciences.org' %}
{% set journal_cms_url = 'https://continuumtest--journal-cms.elifesciences.org' %}
{% set medium_url = 'http://continuumtest--medium.elife.internal' %}
{% set search_url = 'http://continuumtest--search.elife.internal' %}
{% set recommendations_url = 'http://continuumtest--recommendations.elife.internal' %}
{% set gateway_url_public = 'https://continuumtest--cdn-gateway.elifesciences.org' %}
{% set gateway_url_internal = 'http://continuumtest--gateway.elife.internal' %}
{% set gateway_url_for_migration = 'https://prod--gateway.elifesciences.org' %}
{% set lax_url = 'https://continuumtest--lax.elifesciences.org' %}
{% set metrics_url = 'http://continuumtest--metrics.elife.internal' %}
{% set profiles_url = 'http://continuumtest--profiles.elife.internal' %}
{% set annotations_url = 'http://continuumtest--annotations.elife.internal' %}
{% set digests_url = 'http://continuumtest--digests.elife.internal' %}
{% set iiif_url = 'https://continuumtest--cdn-iiif.elifesciences.org' %}

journal:
    feature_xpub: true
    submit_url: https://staging--xpub.elifesciences.org/login

journal_cms:
    aws:
        queue: journal-cms--continuumtest
        topic_template: arn:aws:sns:us-east-1:512686554592:bus-%s--continuumtest
    journal:
        base_uri: {{ journal_url }}
        preview_uri: {{ journal_preview_url }}
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

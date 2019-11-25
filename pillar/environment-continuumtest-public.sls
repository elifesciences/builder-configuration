elife:
    env: continuumtest

{% set journal_url = 'https://continuumtest--journal.elifesciences.org' %}
{% set journal_preview_url = 'https://continuumtestpreview--journal.elifesciences.org' %}
{% set journal_cms_url = 'https://continuumtest--journal-cms.elifesciences.org' %}
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

{% set hypothesis_api = 'https://hypothes.is/api/' %}
{% set hypothesis_authority = 'test.elifesciences.org' %}

journal:
    api_url: {{ gateway_url_internal }}
    api_url_public: {{ gateway_url_public }}
    # not yet active
    side_by_side_view_url: https://continuumtest--lens.elifesciences.org
    # not yet active
    #observer_url: http://continuumtest--observer.elife.internal
    default_host: continuumtest--cdn-journal.elifesciences.org

    oauth2_client_id: journal--continuumtest

    mailer:
        host: smtp.mailtrap.io
        port: 25
        # username: # see builder-private
        # password: # see builder-private
        encryption: tls

    status_checks:
        Annotations: ping/annotations
        Digests: ping/digests
        Journal CMS: ping/journal-cms
        Lax: ping/lax
        Metrics: ping/metrics
        Profiles: ping/profiles
        Recommendations: ping/recommendations
        Search: ping/search
    hypothesis_api: {{ hypothesis_api }}
    hypothesis_authority: {{ hypothesis_authority }}
    hypothesis_client_id: a22cf324-9145-11e6-8cb6-27d92694374e
    # hypothesis_client_secret: # see builder-private
    xpub_client_id: journal--continuumtest
    # xpub_client_secret: # see builder-private
    # turned on temporarily to reproduce production environment in Fastly shield debugging
    cache_control: public, max-age={{ 60 * 30 }}, s-maxage={{ 60 * 62 }}, stale-while-revalidate={{ 60 * 60 * 12 }}, stale-if-error={{ 60 * 60 * 24 }}
    feature_xpub: true
    submit_url: https://libero-reviewer--staging.elifesciences.org/login
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

lax:
    glencoe:
        cache_requests: False

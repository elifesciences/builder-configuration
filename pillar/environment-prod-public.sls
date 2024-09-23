elife:
    env: prod

{% set journal_url = 'https://elifesciences.org' %}
{% set journal_preview_url = 'https://preview--journal.elifesciences.org' %}
{% set journal_cms_url = 'https://prod--journal-cms.elifesciences.org' %}
{% set search_url = 'http://prod--search.elife.internal' %}
{% set recommendations_url = 'http://prod--recommendations.elife.internal' %}
{% set lax_url = 'https://prod--lax.elifesciences.org' %}
{% set gateway_url_public = 'https://api.elifesciences.org' %}
{% set gateway_url_internal = 'http://prod--gateway.elife.internal' %}
{% set gateway_url_for_migration = 'https://prod--gateway.elifesciences.org' %}
{% set metrics_url = 'http://prod--metrics.elife.internal' %}
{% set profiles_url = 'http://prod--profiles.elife.internal' %}
{% set annotations_url = 'http://prod--annotations.elife.internal' %}
{% set digests_url = 'http://prod--digests.elife.internal' %}
{% set iiif_url = 'https://iiif.elifesciences.org' %}

{% set hypothesis_api = 'https://hypothes.is/api/' %}
{% set hypothesis_authority = 'elifesciences.org' %}

api_gateway:
    kong_container:
        # 'latest' as of 2023-07-07
        image_tag: 8cab29b5ef0a37f50615cf984bf35a828bca7966

journal:
    api_url: {{ gateway_url_internal }}
    api_url_search_page: https://prod--epp.elifesciences.org
    api_url_public: {{ gateway_url_public }}
    side_by_side_view_url: https://lens.elifesciences.org
    observer_url: http://prod--observer.elife.internal
    # no trailing slashes. leave empty to prevent adding redirect rules.
    preprint_url: https://prod--epp.elifesciences.org
    default_host: elifesciences.org
    # gtm_id: # see builder-private
    # google_optimize_id: # see builder-private
    cb_id: 0a5c50d8-fcf9-47b1-8f4f-1eaadb13941b
    oauth2_client_id: journal--prod
    status_checks:
        Annotations: ping/annotations
        Digests: ping/digests
        Journal CMS: ping/journal-cms
        Lax: ping/lax
        Metrics: ping/metrics
        Profiles: ping/profiles
        Recommendations: ping/recommendations
        Search: ping/search
    critical_css: True
    redis_cache: true # ElastiCache
    redis_sessions: true # ElastiCache
    hypothesis_api: {{ hypothesis_api }}
    hypothesis_authority: {{ hypothesis_authority }}
    hypothesis_client_id: af8e486c-d495-11e7-8c9b-7ba603c19e52
    # hypothesis_client_secret: # see builder-private
    xpub_client_id: journal--prod
    # xpub_client_secret: # see builder-private
    cache_control: public, max-age={{ 60 * 30 }}, s-maxage={{ 60 * 62 }}, stale-while-revalidate={{ 60 * 60 * 12 }}, stale-if-error={{ 60 * 60 * 24 }}
    feature_xpub: true
    submit_url: https://reviewer.elifesciences.org/login
    submit_url_redirects:
        - .*\.elifesciences.org$
        
journal_cms:
    aws:
        queue: journal-cms--prod
        topic_template: arn:aws:sns:us-east-1:512686554592:bus-%s--prod
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
        all_reviewed_preprints_endpoint: {{ gateway_url_internal }}/reviewed-preprints
        all_digests_endpoint: {{ gateway_url_internal }}/digests
        article_fragments_endpoint: {{ gateway_url_internal }}/articles/%s/fragments/%s

lax:
    # lsh@2021-02: re-enabled after api-raml changes allow snippets to be valid. see ./pillar/lax-public.sls
    #app:
    #    merge_foreign_fragments: False
    glencoe:
        cache_requests: False
    botlax:
        api:
            url: http://prod--gateway.elife.internal

search:
    api:
        url: http://prod--gateway.elife.internal
        requests_batch: 20

    opensearch:
        servers: http://prod--search--1.elife.internal:9201

    gearman:
        servers: prod--search--1.elife.internal

    rate_limit_minimum_page: 21

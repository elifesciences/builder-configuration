elife:
    env: end2end

{% set journal_cms_url = 'https://end2end--journal-cms.elifesciences.org' %}
{% set journal_url = 'https://end2end--journal.elifesciences.org' %}
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
{% set bioprotocol_url = 'http://end2end--bp.elife.internal' %}

{% set hypothesis_api = 'http://end2end--annotations.elife.internal:8003/' %}
{% set hypothesis_authority = 'end2end.elifesciences.org' %}

journal:
    api_url: {{ gateway_url_internal }}
    api_url_search_page: {{ gateway_url_internal }}
    api_url_public: {{ gateway_url_public }}
    # not yet active
    side_by_side_view_url: https://end2end--lens.elifesciences.org
    observer_url: http://end2end--observer.elife.internal
    # no trailing slashes. leave empty to prevent adding redirect rules.
    preprint_url: https://staging--epp.elifesciences.org
    default_host: end2end--cdn-journal.elifesciences.org
    redis_cache: true # ElastiCache
    redis_sessions: true # ElastiCache
    oauth2_client_id: journal--end2end
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
    hypothesis_api: {{ hypothesis_api }}
    hypothesis_authority: {{ hypothesis_authority }}
    hypothesis_client_id: foo
    # hypothesis_client_secret: # see builder-private
    xpub_client_id: journal--end2end
    # xpub_client_secret: # see builder-private
    cache_control: public, max-age={{ 60 * 30 }}, s-maxage={{ 60 * 62 }}, stale-while-revalidate={{ 60 * 60 * 12 }}, stale-if-error={{ 60 * 60 * 24 }}
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
        all_reviewed_preprints_endpoint: {{ gateway_url_internal }}/reviewed-preprints
        all_digests_endpoint: {{ gateway_url_internal }}/digests
        article_fragments_endpoint: {{ gateway_url_internal }}/articles/%s/fragments/%s

lax:
    glencoe:
        cache_requests: False

search:
    api:
        url: http://end2end--gateway.elife.internal
        requests_batch: 20

    opensearch:
        servers: http://end2end--search--1.elife.internal:9201
        logging: true

    gearman:
        servers: end2end--search--1.elife.internal

    rate_limit_minimum_page: 21

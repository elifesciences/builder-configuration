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


elife_xpub:
    api:
        endpoint: https://reviewer.elifesciences.org
    pubsweet:
        base_url: https://reviewer.elifesciences.org
    meca:
        sftp:
            connection:
                host: sftp.ejpress.com
                # EJP sandbox credentials
                # username: 
                # password:
    s3:
        bucket: prod-elife-xpub
    mailer:
        host: email-smtp.us-east-1.amazonaws.com
        port: 587
        # `ses-smtp-user.elife-xpub` IAM user
        # see https://docs.aws.amazon.com/ses/latest/DeveloperGuide/smtp-credentials.html for explanations, but it's easier to create a new user than to derive its SMTP credentials from the AWS ones
        # user:
        # pass:
    deployment_target: prod

journal:
    api_url: {{ gateway_url_internal }}
    api_url_public: {{ gateway_url_public }}
    side_by_side_view_url: https://lens.elifesciences.org
    observer_url: http://prod--observer.elife.internal
    default_host: elifesciences.org
    # gtm_id: # see builder-private
    cookie_consent: true
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
    subject_rewrites:
        - from_id: medicine
          to_id: human-biology-medicine
          to_name: Human Biology and Medicine

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
        all_digests_endpoint: {{ gateway_url_internal }}/digests
        article_fragment_images_endpoint: {{ gateway_url_internal }}/articles/%s/fragments/image

lax:
    glencoe:
        cache_requests: False

data_pipeline:
    bigquery_views:
        materialize_arguments: ''

search:
    api:
        url: http://prod--gateway.elife.internal
        requests_batch: 20

    elasticsearch:
        servers: http://prod--search--1.elife.internal:9200

    gearman:
        servers: prod--search--1.elife.internal

    rate_limit_minimum_page: 21

elife:
    env: prod

{% set journal_url = 'https://elifesciences.org' %}
{% set journal_preview_url = 'https://preview--journal.elifesciences.org' %}
{% set journal_cms_url = 'https://prod--journal-cms.elifesciences.org' %}
{% set medium_url = 'http://prod--medium.elife.internal' %}
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
    feature_xpub: true
    submit_url: https://reviewer.elifesciences.org/login

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

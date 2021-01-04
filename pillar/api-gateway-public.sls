# Defaults ad-hoc instances to continuumtest as 
# - CI instances are almost always turned off or being deprecated
# - CI instances shouldn't be accessed by another project
# - Continuumtest should let the ad-hoc instance gateway serve test requests without hampering production
{% set journal_cms_url = 'http://continuumtest--journal-cms.elife.internal' %}
{% set search_url = 'http://continuumtest--search.elife.internal' %}
{% set recommendations_url = 'http://continuumtest--recommendations.elife.internal' %}
{% set lax_url = 'https://continuumtest--lax.elifesciences.org' %}
{% set metrics_url = 'http://continuumtest--metrics.elife.internal' %}
{% set profiles_url = 'http://continuumtest--profiles.elife.internal' %}
{% set annotations_url = 'http://continuumtest--annotations.elife.internal' %}
{% set digests_url = 'http://continuumtest--digests.elife.internal' %}
{% set bioprotocol_url = 'http://continuumtest--bp.elife.internal' %}

api_gateway:

    admin: http://localhost:8001

    kong_container:
        image_tag: latest

    db:
        engine: postgres
        host: "127.0.0.1"
        port: 5432
        name: kong
        username: kong
        # password: 

    # known API endpoints
    # https://getkong.org/docs/0.8.x/admin-api/#add-api
    endpoints:
        labs:
            upstream_url: {{ journal_cms_url }}
            uris: /labs-posts
            strip_uri: False

        subjects:
            upstream_url: {{ journal_cms_url }}
            uris: /subjects
            strip_uri: False

        podcast_episodes:
            upstream_url: {{ journal_cms_url }}
            uris: /podcast-episodes
            strip_uri: False

        people:
            upstream_url: {{ journal_cms_url }}
            uris: /people
            strip_uri: False

        search:
            upstream_url: {{ search_url }}
            uris: /search
            strip_uri: False

        recommendations:
            upstream_url: {{ recommendations_url }}
            uris: /recommendations
            strip_uri: False

        articles:
            upstream_url: {{ lax_url }}/api/v2
            uris: /articles
            strip_uri: False

        blog_articles:
            upstream_url: {{ journal_cms_url }}
            uris: /blog-articles
            strip_uri: False

        events:
            upstream_url: {{ journal_cms_url }}
            uris: /events
            strip_uri: False

        interviews:
            upstream_url: {{ journal_cms_url }}
            uris: /interviews
            strip_uri: False

        collections:
            upstream_url: {{ journal_cms_url }}
            uris: /collections
            strip_uri: False

        promotional_collections:
            upstream_url: {{ journal_cms_url }}
            uris: /promotional-collections
            strip_uri: False

        community:
            upstream_url: {{ journal_cms_url }}
            uris: /community
            strip_uri: False

        covers:
            upstream_url: {{ journal_cms_url }}
            uris: /covers
            strip_uri: False

        press_packages:
            upstream_url: {{ journal_cms_url }}
            uris: /press-packages
            strip_uri: False

        job_adverts:
            upstream_url: {{ journal_cms_url }}
            uris: /job-adverts
            strip_uri: False

        highlights:
            upstream_url: {{ journal_cms_url }}
            uris: /highlights
            strip_uri: False

        annual_reports:
            upstream_url: {{ journal_cms_url }}
            uris: /annual-reports
            strip_uri: False

        metrics:
            upstream_url: {{ metrics_url }}/api/v2
            uris: /metrics
            strip_uri: True

        oauth2:
            upstream_url: {{ profiles_url }}
            uris: /oauth2
            strip_uri: False

        profiles:
            upstream_url: {{ profiles_url }}
            uris: /profiles
            strip_uri: False

        annotations:
            upstream_url: {{ annotations_url }}
            uris: /annotations
            strip_uri: False

        digests:
            upstream_url: {{ digests_url }}
            uris: /digests
            strip_uri: False

        bioprotocol:
            upstream_url: {{ bioprotocol_url }}
            uris: /bioprotocol
            strip_uri: False

        ping_annotations:
            upstream_url: {{ annotations_url }}/ping
            uris: /ping/annotations
            strip_uri: True

        ping_digests:
            upstream_url: {{ digests_url }}/ping
            uris: /ping/digests
            strip_uri: True

        ping_bioprotocol:
            upstream_url: {{ bioprotocol_url }}/ping
            uris: /ping/bioprotocol
            strip_uri: True

        ping_journal_cms:
            upstream_url: {{ journal_cms_url }}/ping
            uris: /ping/journal-cms
            strip_uri: True

        ping_lax:
            upstream_url: {{ lax_url }}/api/v2/ping
            uris: /ping/lax
            strip_uri: True

        ping_metrics:
            upstream_url: {{ metrics_url }}/api/v2/ping
            uris: /ping/metrics
            strip_uri: True

        ping_profiles:
            upstream_url: {{ profiles_url }}/ping
            uris: /ping/profiles
            strip_uri: True

        ping_recommendations:
            upstream_url: {{ recommendations_url }}/ping
            uris: /ping/recommendations
            strip_uri: True

        ping_search:
            upstream_url: {{ search_url }}/ping
            uris: /ping/search
            strip_uri: True

    # APIs that once existed but should not exist any longer
    absent_endpoints:
        - bunyip

    # complex configuration involving credentials, see builder-private
    # endpoint_plugins:

    consumers:
        # user: key
        anonymous: public
        # some-elife-app: secretkey
        # removing a consumer is a two-step process. 
        # 1. consumer must be present in order to be removed from groups. consumer 'key' value isn't used.
        # 2. remove from absent_groups
        # 3. consumer can be removed

    groups:
        anonymous:
            - user
        journal-cms-unpublished-content:
            - view-unpublished-content
        journal--prod:
            - user
            - view-restricted-annotations
            - view-restricted-profiles
        journal--staging:
            - view-restricted-annotations
            - view-restricted-profiles
            - view-unpublished-content
        lax:
            - user
        search:
            - user
        recommendations:
            - user
        alfred:
            - view-restricted-annotations
            - view-restricted-profiles
            - view-unpublished-content
        elife-bot:
            - edit-digests
            - view-unpublished-content

    # api consumers who once existed but should not exist any longer
    absent_consumers:
        - bottersnipe
        - website
        - elife-xpub

    absent_groups:
        journal-cms-unpublished-content:
            - admin
        journal--staging:
            - admin
        alfred:
            - admin

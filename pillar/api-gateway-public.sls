# Defaults ad-hoc instances to continuumtest as 
# - CI instances are almost always turned off or being deprecated
# - CI instances shouldn't be accessed by another project
# - Continuumtest should let the ad-hoc instance gateway serve test requests without hampering production
{% set journal_cms_url = 'http://continuumtest--journal-cms.elife.internal' %}
{% set medium_url = 'http://continuumtest--medium.elife.internal' %}
{% set search_url = 'http://continuumtest--search.elife.internal' %}
{% set recommendations_url = 'http://continuumtest--recommendations.elife.internal' %}
{% set lax_url = 'https://continuumtest--lax.elifesciences.org' %}
{% set metrics_url = 'http://continuumtest--metrics.elife.internal' %}
{% set profiles_url = 'http://continuumtest--profiles.elife.internal' %}
{% set annotations_url = 'http://continuumtest--annotations.elife.internal' %}
{% set digests_url = 'http://continuumtest--digests.elife.internal' %}

api_gateway:

    admin: http://localhost:8001

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
            request_path: /labs-posts

        subjects:
            upstream_url: {{ journal_cms_url }}
            request_path: /subjects

        podcast_episodes:
            upstream_url: {{ journal_cms_url }}
            request_path: /podcast-episodes

        people:
            upstream_url: {{ journal_cms_url }}
            request_path: /people

        medium:
            upstream_url: {{ medium_url }}
            request_path: /medium-articles

        search:
            upstream_url: {{ search_url }}
            request_path: /search

        recommendations:
            upstream_url: {{ recommendations_url }}
            request_path: /recommendations

        articles:
            upstream_url: {{ lax_url }}/api/v2
            request_path: /articles

        blog_articles:
            upstream_url: {{ journal_cms_url }}
            request_path: /blog-articles

        events:
            upstream_url: {{ journal_cms_url }}
            request_path: /events

        interviews:
            upstream_url: {{ journal_cms_url }}
            request_path: /interviews

        collections:
            upstream_url: {{ journal_cms_url }}
            request_path: /collections

        community:
            upstream_url: {{ journal_cms_url }}
            request_path: /community

        covers:
            upstream_url: {{ journal_cms_url }}
            request_path: /covers

        press_packages:
            upstream_url: {{ journal_cms_url }}
            request_path: /press-packages

        job_adverts:
            upstream_url: {{ journal_cms_url }}
            request_path: /job-adverts

        highlights:
            upstream_url: {{ journal_cms_url }}
            request_path: /highlights

        annual_reports:
            upstream_url: {{ journal_cms_url }}
            request_path: /annual-reports

        metrics:
            upstream_url: {{ metrics_url }}/api/v2
            request_path: /metrics
            strip_request_path: True

        oauth2:
            upstream_url: {{ profiles_url }}
            request_path: /oauth2

        profiles:
            upstream_url: {{ profiles_url }}
            request_path: /profiles

        annotations:
            upstream_url: {{ annotations_url }}
            request_path: /annotations

        digests:
            upstream_url: {{ digests_url }}
            request_path: /digests

        ping_annotations:
            upstream_url: {{ annotations_url }}/ping
            request_path: /ping/annotations
            strip_request_path: True

        ping_digests:
            upstream_url: {{ digests_url }}/ping
            request_path: /ping/digests
            strip_request_path: True

        ping_journal_cms:
            upstream_url: {{ journal_cms_url }}/ping
            request_path: /ping/journal-cms
            strip_request_path: True

        ping_lax:
            upstream_url: {{ lax_url }}/api/v2/ping
            request_path: /ping/lax
            strip_request_path: True

        ping_medium:
            upstream_url: {{ medium_url }}/ping
            request_path: /ping/medium
            strip_request_path: True

        ping_metrics:
            upstream_url: {{ metrics_url }}/api/v2/ping
            request_path: /ping/metrics
            strip_request_path: True

        ping_profiles:
            upstream_url: {{ profiles_url }}/ping
            request_path: /ping/profiles
            strip_request_path: True

        ping_recommendations:
            upstream_url: {{ recommendations_url }}/ping
            request_path: /ping/recommendations
            strip_request_path: True

        ping_search:
            upstream_url: {{ search_url }}/ping
            request_path: /ping/search
            strip_request_path: True

    # APIs that once existed but should not exist any longer
    absent_endpoints:
        - bunyip

    # complex configuration involving credentials, see builder-private
    # endpoint_plugins:

    consumers:
        # user: key
        anonymous: public
        # elife-xpub: secretkey

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
        elife-xpub:
            - view-restricted-people
            - view-restricted-profiles

    # api consumers who once existed but should not exist any longer
    absent_consumers:
        - bottersnipe
        - website

    absent_groups:
        journal-cms-unpublished-content:
            - admin
        journal--staging:
            - admin
        alfred:
            - admin

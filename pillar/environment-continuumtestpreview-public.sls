elife:
    env: continuumtestpreview

journal:
    api_url: https://api.test.elifesciences.org
    api_url_search_page: https://api.test.elifesciences.org
    api_url_public: https://api.test.elifesciences.org
    # api_key: # see builder-private
    oauth2_client_id: journal--continuumtestpreview
    xpub_client_id: journal--continuumtestpreview
    # xpub_client_secret: # see builder-private
    status_checks:
        Annotations: ping/annotations
        Digests: ping/digests
        Journal CMS: ping/journal-cms
        Lax: ping/lax
        Metrics: ping/metrics
        Profiles: ping/profiles
        Recommendations: ping/recommendations
        Search: ping/search

    # web_users: # see builder-private

    feature_xpub: true
    submit_url: https://staging--xpub.elifesciences.org/login
    submit_url_redirects:
        - .*\.elifesciences.org$

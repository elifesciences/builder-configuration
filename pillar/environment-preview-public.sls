elife:
    env: preview

journal:
    api_url: https://api.prod.elifesciences.org
    api_url_search_page: https://api.prod.elifesciences.org
    api_url_public: https://api.prod.elifesciences.org
    # no trailing slashes. leave empty to prevent adding redirect rules.
    preprint_url: https://prod--epp.elifesciences.org
    # api_key: # see builder-private
    oauth2_client_id: journal--preview
    xpub_client_id: journal--preview
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
    feature_xpub: false
    submit_url: https://reviewer.elifesciences.org/login

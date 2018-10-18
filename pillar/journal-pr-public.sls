elife:
    env: continuumtest

journal:
    api_url: http://prod--gateway.elife.internal
    api_url_public: https://api.elifesciences.org
    status_checks:
        Annotations: ping/annotations
        Digests: ping/digests
        Journal CMS: ping/journal-cms
        Lax: ping/lax
        Metrics: ping/metrics
        Profiles: ping/profiles
        Recommendations: ping/recommendations
        Search: ping/search

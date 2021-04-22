elife:
    env: preview

journal:
    api_url: http://prod--gateway.elife.internal
    api_url_public: https://prod--gateway.elifesciences.org
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
    calls_to_action:
      - id: survey2021
        path: ^/
        text: Voice your concerns about research culture and research communication: Have your say in our 7th annual survey.
        button:
            text: Take the Survey
            path: https://www.surveymonkey.co.uk/r/LTS6DDT
        image:
            alt: ''
            uri: https://iiif.elifesciences.org/lax/survey2019.png
            source:
                mediaType: image/png
                uri: https://iiif.elifesciences.org/lax/survey2019.png/full/full/0/default.png
                filename: survey2019.png
            size:
                width: 600
                height: 600
        needsJs: true

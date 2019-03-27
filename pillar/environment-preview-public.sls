elife:
    env: preview

journal:
    feature_xpub: false
    submit_url: https://reviewer.elifesciences.org/login
    calls_to_action:
      - id: survey2019
        path: ^/
        text: Tell us how you feel about eLife. Share your views in our short survey and be entered to win a $50 voucher for you or one of five charities.
        button:
            text: Give feedback
            path: https://www.surveymonkey.co.uk/r/eLife2019feedback
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

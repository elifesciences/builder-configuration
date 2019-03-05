elife:
    env: preview

journal:
    feature_xpub: false
    submit_url: https://reviewer.elifesciences.org/login
    calls_to_action:
      - id: eisen2019
        path: ^(/$|/about$|/about/|/for-the-press$|/for-the-press/5cc21558/)
        text: 'Hear more about Michael Eisen, our new Editor-in-Chief, and the latest developments at eLife'
        button:
            text: 'Sign up for eLife news'
            path: https://crm.elifesciences.org/crm/elife-news
        image:
            alt: ''
            uri: https://iiif.elifesciences.org/journal-cms/person%%2F2019-03%%2Fmike.jpg
            source:
                mediaType: image/jpg
                uri: https://iiif.elifesciences.org/journal-cms/person%%2F2019-03%%2Fmike.jpg/full/full/0/default.jpg
                filename: mike.jpg
            size:
                width: 7360
                height: 4912

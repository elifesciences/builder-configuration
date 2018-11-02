api_gateway:
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

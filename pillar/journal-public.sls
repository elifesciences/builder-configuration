journal:
    api_url: ''
    api_url_public: ''
    # api_key: # see builder-private 
    side_by_side_view_url: https://lens.elifesciences.org
    observer_url: http://prod--observer.elife.internal
    default_host: null

    gtm_id: null
    cookie_consent: false

    # secret: # see builder-private

    session_name: journal

    web_users: {}

    robots:
        - |
            User-Agent: *
            Disallow: $robots_disallow
            Disallow: /download/
        - | 
            User-agent: Amazonbot
            Disallow: /search/
        - | 
            User-agent: turnitinbot
            Disallow: /search/
        - | 
            User-agent: bingbot
            Disallow: /search/

    redis_cache: null
    redis_sessions: null

    # mailer: see builder-private

    #status_checks:
    #    Articles: articles

    critical_css: False

    # requests for sub.domain.tld are redirected to domain.tld/whatever
    subdomain_redirects:
        # 2016 annual report
        2016: /inside-elife/d457b4cd
        # temporary documentation website - just a blog post
        developers: /elife-news/inside-elife-resources-developers
        # legacy subdomains
        elife:
        prod:
        www:

    oauth2_client_id: journal--fake
    # oauth2_client_secret: # see builder-private

    hypothesis_api: https://hypothes.is/api/
    hypothesis_authority: some-authority
    hypothesis_client_id: some-id
    # hypothesis_client_secret: # see builder-private

    xpub_client_id: journal--fake
    # xpub_client_secret: # see builder-private

    cache_control: private, no-cache, no-store, must-revalidate

    subject_rewrites: []

    rds_articles:
        '30274': https://repro.elifesciences.org/example.html
    dismissible_info_bars:
        aging:
            id: aging-special-issue
            text: '<a href="https://elifesciences.org/inside-elife/4f706531/special-issue-call-for-papers-in-aging-geroscience-and-longevity">Read the call for papers</a> for the eLife Special Issue on Aging, Geroscience and Longevity'
            article_ids:
                - '00065'

    submit_url: https://submit.elifesciences.org/
    feature_xpub: false
    calls_to_action: []

elife:
    redis:
        maxmemory: 512

api_dummy:
    standalone: False
    pinned_revision_file: /srv/journal/api-dummy.sha1

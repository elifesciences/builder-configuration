journal:
    api_url: ''
    api_url_search_page: ''
    api_url_public: ''
    # api_key: # see builder-private
    side_by_side_view_url: https://lens.elifesciences.org
    observer_url: http://prod--observer.elife.internal
    pubpub_url: https://elife-container.pubpub.org
    # no trailing slashes. leave empty to prevent adding redirect rules.
    preprint_url:
    about_url: https://elife-container.pubpub.org
    resources_url: https://elife-container.pubpub.org
    media_policy_url: https://elife-container.pubpub.org 
    community_url: https://elife-container.pubpub.org/community
    privacy_notice_url: https://elife-container.pubpub.org/privacy-notice
    cookie_declaration_url: https://elife-container.pubpub.org/cookie-declaration
    learning_resources_url: https://elife-container.pubpub.org/learning-resources
    hubspot_url: https://connect.elifesciences.org
    default_host: null

    google_api_client:
        client_id: some-id
        client_secret: ThisIsASecret
        refresh_token: Refreshtoken
        optout_unsubscribe_spreadsheet_id: spreadsheet-id

    gtm_id: null
    google_optimize_id: null
    cb_id: null

    # secret: # see builder-private

    session_name: journal

    web_users: {}

    # https://www.robotstxt.org/robotstxt.html
    # "Robots Exclusion Protocol": https://www.rfc-editor.org/rfc/rfc9309.html
    # non-standard extensions: https://en.wikipedia.org/wiki/Robots.txt#Nonstandard_extensions
    # Google guidelines: https://developers.google.com/search/reference/robots_txt#url-matching-based-on-path-values
    robots:
        - |
            User-agent: *
            Disallow: $robots_disallow
            Disallow: /search
            Disallow: /download/
            Crawl-delay: 10
        # Googlebot related:
        # * https://github.com/elifesciences/issues/issues/5860
        # * https://github.com/elifesciences/journal-formula/pull/103
        # * https://github.com/elifesciences/issues/issues/8515
        - |
            User-agent: Googlebot
            Disallow: /*.ris
            Disallow: /*.bib
            Allow: /search$dollar
            Disallow: /search?
            Disallow: /download/

        # block these entirely
        - |
            User-agent: Amazonbot
            Disallow: /
        - |
            User-agent: SemrushBot
            Disallow: /
        - |
            User-agent: MJ12bot
            Disallow: /
        - |
            User-agent: trendkite-akashic-crawler
            Disallow: /
        - |
            User-agent: Seekport Crawler
            Disallow: /
        - |
            User-agent: Linespider
            Disallow: /
        - |
            Sitemap: https://elifesciences.org/sitemap.xml

    redis_cache: null
    redis_sessions: null

    # mailer: see builder-private
        # absolute hostname in real environments, reachable from any container
        #host: localhost
        #port: 25
        #username: anonymous
        #password: ""
        #encryption: "null"

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

    {% import_yaml "era-articles.yaml" as era_articles %}
    era_articles: {{ era_articles|yaml }}
    rds_articles: {{ era_articles|yaml }}

    dismissible_info_bars: {}

    submit_url: https://submit.elifesciences.org/
    feature_xpub: false
    submit_redirect_url: https://elife-rp.msubmit.net/
    calls_to_action: []

elife:
    redis:
        maxmemory: 512

api_dummy:
    standalone: False
    pinned_revision_file: /srv/journal/api-dummy.sha1

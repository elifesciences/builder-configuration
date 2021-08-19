journal:
    api_url: ''
    api_url_public: ''
    # api_key: # see builder-private
    side_by_side_view_url: https://lens.elifesciences.org
    observer_url: http://prod--observer.elife.internal
    default_host: null

    gtm_id: null
    google_optimize_id: null
    cb_id: null
    cookie_consent: false

    # secret: # see builder-private

    session_name: journal

    web_users: {}

    # robots.txt guidelines:
    # - https://developers.google.com/search/reference/robots_txt#url-matching-based-on-path-values
    # 'crawl-delay' directive:
    # - https://en.wikipedia.org/wiki/Robots_exclusion_standard#Crawl-delay_directive
    # lsh@2021-01-04: bingbot ignores rules that apply to all bots (*) if it has a specific entry.
    # lsh@2021-02-09: robots.txt has no proper specification! https://github.com/elifesciences/issues/issues/6451
    robots:
        - |
            User-agent: *
            Disallow: $robots_disallow
            Disallow: /download/
            Crawl-delay: 10
        # probably unnecessary:
        # https://github.com/elifesciences/issues/issues/5860
        - |
            User-agent: Googlebot
            Disallow: /*.ris
            Disallow: /*.bib
            Disallow: /download/
        - |
            User-agent: Amazonbot
            Disallow: /search
            Disallow: /download/
        - |
            User-agent: turnitinbot
            Disallow: /search
            Disallow: /download/
        - |
            User-agent: bingbot
            Disallow: /search
            Disallow: /download/
            Crawl-delay: 10
        # https://megaindex.com/crawler
        - |
            User-agent: MegaIndex.ru
            Disallow: /search
            Disallow: /download/
        - |
            User-agent: megaindex.com
            Disallow: /search
            Disallow: /download/
        # https://www.semrush.com/bot/
        - |
            User-agent: SemrushBot
            Disallow: /
            Disallow: /download/
        # paid-for SEO search engine
        # consistently hundreds of requests an hour
        - |
            User-agent: MJ12bot
            Disallow: /
        - |
            Sitemap: https://elifesciences.org/sitemap.xml
        - |
            User-agent: trendkite-akashic-crawler
            Disallow: /

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
    calls_to_action: []

elife:
    redis:
        maxmemory: 512

api_dummy:
    standalone: False
    pinned_revision_file: /srv/journal/api-dummy.sha1

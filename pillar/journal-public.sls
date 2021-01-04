journal:
    api_url: ''
    api_url_public: ''
    # api_key: # see builder-private
    side_by_side_view_url: https://lens.elifesciences.org
    observer_url: http://prod--observer.elife.internal
    default_host: null

    gtm_id: null
    google_optimize_id: null
    cookie_consent: false

    # secret: # see builder-private

    session_name: journal

    web_users: {}

    # robots.txt guidelines:
    # - https://developers.google.com/search/reference/robots_txt#url-matching-based-on-path-values
    # 'crawl-delay' directive:
    # - https://en.wikipedia.org/wiki/Robots_exclusion_standard#Crawl-delay_directive
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
        - |
            User-agent: Amazonbot
            Disallow: /search
        - |
            User-agent: turnitinbot
            Disallow: /search
        # lsh@2020-01-04: bingbot ignores rules that apply to all bots (*) if it has a specific entry.
        # told to me during email correspondence with bingbot support.
        - |
            User-agent: bingbot
            Disallow: /download/
            Disallow: /search
            Crawl-delay: 10
        # https://megaindex.com/crawler
        - |
            User-agent: MegaIndex.ru
            Disallow: /search
        - |
            User-agent: megaindex.com
            Disallow: /search
        # https://www.semrush.com/bot/
        - |
            User-agent: SemrushBot
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

    dismissible_info_bars:
        aging:
            id: aging-special-issue
            text: '<a href="https://elifesciences.org/inside-elife/4f706531/special-issue-call-for-papers-in-aging-geroscience-and-longevity">Read the call for papers</a> for the eLife Special Issue on Aging, Geroscience and Longevity.'
            article_ids:
                - '00065'
                - '00286'
                - '00306'
                - '00515'
                - '00518'
                - '00537'
                - '01098'
                - '01883'
                - '02077'
                - '03504'
                - '03706'
                - '03790'
                - '05505'
                - '05949'
                - '06003'
                - '06184'
                - '06197'
                - '07836'
                - '08186'
                - '08527'
                - '08833'
                - '09221'
                - '09594'
                - '09709'
                - '10161'
                - '10956'
                - '12010'
                - '13943'
                - '16351'
                - '16843'
                - '16923'
                - '17185'
                - '17214'
                - '17915'
                - '18459'
                - '18648'
                - '19130'
                - '19264'
                - '19484'
                - '19493'
                - '20340'
                - '20851'
                - '20914'
                - '21491'
                - '21690'
                - '23493'
                - '24059'
                - '24506'
                - '24662'
                - '26464'
                - '26652'
                - '26952'
                - '27014'
                - '27692'
                - '27842'
                - '28129'
                - '28329'
                - '29815'
                - '31157'
                - '31268'
                - '32127'
                - '32421'
                - '33781'
                - '34081'
                - '34427'
                - '34701'
                - '34836'
                - '34970'
                - '34985'
                - '35330'
                - '35368'
                - '35551'
                - '35685'
                - '35878'
                - '36095'
                - '36157'
                - '37316'
                - '37344'
                - '37462'
                - '38635'
                - '39856'
                - '39911'
                - '40314'
                - '40675'
                - '41046'
                - '41258'
                - '41548'
                - '41792'
                - '42650'
                - '42976'
                - '43059'
                - '44219'
                - '44425'
                - '44745'
                - '45415'
                - '45974'
                - '46413'
                - '46418'
                - '47047'
                - '47156'
                - '48186'
                - '48240'
                - '48498'
                - '49132'
                - '49158'
                - '49298'
                - '49455'
                - '49874'
                - '49917'
                - '50140'
                - '50240'
                - '50523'
                - '50778'
                - '51089'
                - '51507'
                - '52283'
                - '54296'
                - '54969'
                - '55220'

    submit_url: https://submit.elifesciences.org/
    feature_xpub: false
    calls_to_action: []

elife:
    redis:
        maxmemory: 512

api_dummy:
    standalone: False
    pinned_revision_file: /srv/journal/api-dummy.sha1

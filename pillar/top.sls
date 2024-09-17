base:
    '*':
        - elife-public
        - elife

    'heavybox--* or (G@project:heavybox)':
        - heavybox-public
        - heavybox
        - pypi

    'master-server--* or (G@project:master-server)':
        - master-server-public
        - master-server
        - environment-prod-public # exception to the rule. keep last
        - environment-prod # exception to the rule. keep last

    'api-gateway--* or (G@project:api-gateway)':
        - api-gateway-public
        - api-gateway

    'elife-bot--* or (G@project:elife-bot)':
        - elife-bot-public
        - elife-bot

    'elife-bot--end2end--* or (G@project:elife-bot and G@environment:end2end)':
        - elife-bot-end2end

    'elife-bot--continuumtest--* or (G@project:elife-bot and G@environment:continuumtest)':
        - elife-bot-continuumtest

    'elife-alfred--* or (G@project:elife-alfred)':
        - elife-alfred-public
        - alfred

    'elife-libraries--* or (G@project:elife-libraries)':
        - elife-libraries
        - pypi

    'containers--* or (G@project:containers)':
        - containers-public
        - containers
        - pypi

    'lax--* or (G@project:lax)':
        - lax-public
        - lax
        - elife-reporting

    'journal--* or (G@project:journal)':
        - journal-public
        - journal

    'journal--preview--* or (G@project:journal and G@environment:preview)':
        - turn-off-daily-updates

    'journal--prod--* or (G@project:journal and G@environment:prod)':
        - turn-off-daily-updates

    'pattern-library--* or (G@project:pattern-library)':
        - pattern-library

    'journal-cms--* or (G@project:journal-cms)':
        - journal-cms-public
        - journal-cms

    'api-dummy--* or (G@project:api-dummy)':
        - api-dummy

    'elife-metrics--* or (G@project:elife-metrics)':
        - elife-metrics

    'elife-dashboard--* or (G@project:elife-dashboard)':
        - elife-dashboard

    'elife-reporting--* or (G@project:elife-reporting)':
        - elife-reporting

    'anonymous--* or (G@project:anonymous)':
        - anonymous

    'search--* or (G@project:search)':
        - search-public
        - search

    'recommendations--* or (G@project:recommendations)':
        - recommendations

    'statusbase--* or (G@project:statusbase)':
        - statusbase

    'observer--* or (G@project:observer)':
        - observer

    'personalised-covers--* or (G@project:personalised-covers)':
        - personalised-covers

    'personalised-covers--ci--* or (G@project:personalised-covers and G@environment:ci)':
        - personalised-covers-ci-public

    'personalised-covers--pr-* or (G@project:personalised-covers and G@environment:pr)':
        - personalised-covers-ci-public

    'iiif--* or (G@project:iiif)':
        - iiif-public
        - iiif

    'redirects--* or (G@project:redirects)':
        - redirects

    'profiles--* or (G@project:profiles)':
        - profiles-public
        - profiles

    'profiles--end2end--* or (G@project:profiles and G@environment:end2end)':
        - profiles-end2end

    'annotations--* or (G@project:annotations)':
        - annotations

    'annotations--end2end--* or (G@project:annotations and G@environment:end2end)':
        - annotations-end2end

    'digests--* or (G@project:digests)':
        - digests

    'bioprotocol--* or (G@project:bioprotocol)':
        - bioprotocol

    'bastion--* or (G@project:bastion)':
        - bastion

    'monitor--* or (G@project:monitor)':
        - monitor


    # per-environment overrides; order of this section is important.


    '*--ci--* or (G@environment:ci)':
        - environment-ci-public
        - environment-ci

    '*--end2end--* or (G@environment:end2end)':
        - environment-end2end-public
        - environment-end2end

    '*--demo--* or (G@environment:demo)':
        - environment-demo-public
        - environment-demo

    '*--continuumtest--* or (G@environment:continuumtest)':
        - environment-continuumtest-public
        - environment-continuumtest

    '*--staging--* or (G@environment:staging)':
        - environment-staging-public
        - environment-staging

    '*--prod--* or (G@environment:prod)':
        - environment-prod-public
        - environment-prod

    '*--preview--* or (G@environment:preview)':
        - environment-preview-public
        - environment-preview

    '*--continuumtestpreview--* or (G@environment:continuumtestpreview)':
        - environment-continuumtestpreview-public
        - environment-continuumtestpreview


    # per-project + per-environment overrides; order of this section is important.


    'search--end2end--* or (G@project:search and G@environment:end2end)':
        - search-end2end

    'journal-cms--prod--* or (G@project:journal-cms and G@environment:prod)':
        - journal-cms-prod

    'journal-cms--continuumtest--* or (G@project:journal-cms and G@environment:continuumtest)':
        - journal-cms-continuumtest


    # misc overrides.


    # lsh@2023-12-15: temporary, remove along with search--rmgearman
    'search--rmgearman--* or (G@project:search and G@environment:rmgearman)':
        - disable-loggly-logging

    # temporary
    'journal--pr-*--* or (G@project:search and G@environment:pr and G@pr:*)':
        - environment-continuumtest-public
        - environment-continuumtest
        - journal-pr-public

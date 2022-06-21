base:
    '*':
        - elife-public
        - elife

    'heavybox--*':
        - heavybox-public
        - heavybox
        - pypi

    'master-server--*':
        - master-server-public
        - master-server
        - environment-prod-public # exception to the rule. keep last
        - environment-prod # exception to the rule. keep last

    'api-gateway--*':
        - api-gateway-public
        - api-gateway

    'elife-bot--*':
        - nvme-ext-disk
        - elife-bot-public
        - elife-bot
        - bitbucket

    'elife-bot--end2end--*':
        - elife-bot-end2end

    'elife-alfred--*':
        - elife-alfred-public
        - alfred

    'elife-libraries--*':
        - nvme-ext-disk
        - elife-libraries
        - pypi

    'containers--*':
        - containers-public
        - containers
        - pypi

    'lax--*':
        - lax-public
        - lax
        - elife-reporting
        - bitbucket

    'journal--*':
        - journal-public
        - journal

    'journal--preview--*':
        - turn-off-daily-updates

    'journal--prod--*':
        - turn-off-daily-updates

    'pattern-library--*':
        - pattern-library

    'journal-cms--*':
        - journal-cms-public
        - journal-cms

    'api-dummy--*':
        - api-dummy

    'elife-metrics--*':
        - elife-metrics

    'elife-dashboard--*':
        - elife-dashboard

    'elife-reporting--*':
        - elife-reporting

    'anonymous--*':
        - anonymous

    'search--*':
        - search-public
        - search

    'recommendations--*':
        - recommendations

    'statusbase--*':
        - statusbase

    'observer--*':
        - observer

    'personalised-covers--*':
        - personalised-covers

    'personalised-covers--ci--*':
        - personalised-covers-ci-public

    'personalised-covers--pr-*':
        - personalised-covers-ci-public

    'iiif--*':
        - iiif-public
        - iiif

    'redirects--*':
        - redirects
        
    'profiles--*':
        - profiles-public
        - profiles

    'profiles--end2end--*':
        - profiles-end2end

    'annotations--*':
        - annotations

    'annotations--end2end--*':
        - annotations-end2end

    'digests--*':
        - digests

    'elife-ink--*':
        - elife-ink

    'bioprotocol--*':
        - bioprotocol

    'bastion--*':
        - bastion


    # per-environment overrides; order of this section is important.
    # lsh@2022-06-15: sections without '--*' look incorrect. what minions are they matching against?


    '*--ci':
        - environment-ci-public
        - environment-ci

    '*--ci--*':
        - environment-ci-public
        - environment-ci

    '*--end2end':
        - environment-end2end-public
        - environment-end2end

    '*--end2end--*':
        - environment-end2end-public
        - environment-end2end

    '*--demo':
        - environment-demo-public
        - environment-demo

    '*--demo--*':
        - environment-demo-public
        - environment-demo

    '*--continuumtest':
        - environment-continuumtest-public
        - environment-continuumtest

    '*--continuumtest--*':
        - environment-continuumtest-public
        - environment-continuumtest

    '*--staging--*':
        - environment-staging-public
        - environment-staging

    '*--prod':
        - environment-prod-public
        - environment-prod

    '*--prod--*':
        - environment-prod-public
        - environment-prod

    '*--preview--*':
        - environment-preview-public
        - environment-preview

    '*--continuumtestpreview--*':
        - environment-continuumtestpreview-public
        - environment-continuumtestpreview


    # per-project + per-environment overrides; order of this section is important.

    
    'journal-cms--continuumtest--*':
        - nvme-ext-disk

    'journal-cms--ci--*':
        - nvme-ext-disk


    # misc overrides.


    # lsh@2021-06-29: temporary
    'journal-cms--continuumtest--*':
        - journal-cms-continuumtest-public

    # temporary
    'journal--title-length--*':
        - environment-title-length-public

    # temporary
    'journal--pr-*--*':
        - environment-continuumtest-public
        - environment-continuumtest
        - journal-pr-public

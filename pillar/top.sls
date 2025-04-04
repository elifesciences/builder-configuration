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
        - elife-bot-public
        - elife-bot

    'elife-bot--continuumtest--*':
        - elife-bot-continuumtest

    'elife-alfred--*':
        - elife-alfred-public
        - alfred

    'elife-libraries--*':
        - elife-libraries-public
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

    'journal--*':
        - journal-public
        - journal

    'journal--preview--*':
        - turn-off-daily-updates

    # enable caddy support for journal preview instances
    'journal--*preview--*':
        - journal-caddy

    'journal--prod--*':
        - turn-off-daily-updates

    'pattern-library--*':
        - pattern-library-public
        - pattern-library

    'journal-cms--*':
        - journal-cms-public
        - journal-cms

    'elife-metrics--*':
        - elife-metrics-public
        - elife-metrics

    'elife-dashboard--*':
        - elife-dashboard-public
        - elife-dashboard

    'elife-reporting--*':
        - elife-reporting

    'recommendations--*':
        - recommendations

    'statusbase--*':
        - statusbase

    'observer--*':
        - observer-public
        - observer

    'iiif--*':
        - iiif-public
        - iiif

    'redirects--*':
        - redirects

    'profiles--*':
        - profiles-public
        - profiles

    'annotations--*':
        - annotations

    'digests--*':
        - digests

    'bioprotocol--*':
        - bioprotocol-public
        - bioprotocol

    'bastion--*':
        - bastion

    'monitor--*':
        - monitor-public
        - monitor


    # per-environment overrides; order of this section is important.


    '*--ci--*':
        - environment-ci-public
        - environment-ci

    '*--continuumtest--*':
        - environment-continuumtest-public
        - environment-continuumtest

    '*--staging--*':
        - environment-staging-public
        - environment-staging

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

    'journal-cms--prod--*':
        - journal-cms-prod

    'journal-cms--continuumtest--*':
        - journal-cms-continuumtest

    # misc overrides.

    # temporary
    'journal--pr-*--*':
        - environment-continuumtest-public
        - environment-continuumtest
        - journal-pr-public

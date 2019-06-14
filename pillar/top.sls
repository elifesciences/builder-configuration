base:
    '*':
        - elife-public
        - elife

    'heavybox--*':
        - heavybox-public
        - pypi

    'master-server--*':
        - master-server
        - environment-prod # exception to the rule. keep last

    'api-gateway--*':
        - api-gateway-public
        - api-gateway

    'lagotto--*':
        - lagotto

    'elife-civiapi--*':
        - civiapi

    'elife-bot--*':
        - elife-bot
        - bitbucket

    'elife-bot--end2end--*':
        - elife-bot-end2end

    'elife-alfred--*':
        - elife-alfred-public
        - alfred

    'elife-libraries--*':
        - elife-libraries
        - pypi

    'containers--*':
        - containers-public
        - containers
        - pypi

    'crm--*':
        - crm

    'crm--ci*':
        - crm-ci

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

    'elife-api--*':
        - elife-api

    'elife-metrics--*':
        - elife-metrics

    'elife-dashboard--*':
        - elife-dashboard

    'elife-reporting--*':
        - elife-reporting

    'anonymous--*':
        - anonymous

    'medium--*':
        - medium

    'search--*':
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

    'peerscout--*':
        - peerscout

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

    'schematron-validator--*':
        - schematron-validator

    'elife-xpub--*':
        - elife-xpub-public
        - elife-xpub

    'elife-xpub--end2end--*':
        - elife-xpub-end2end-public

    'elife-ink--*':
        - elife-ink

    'data-pipeline--*':
        - data-pipeline-public
        - data-pipeline

    'microsimulation-demo--*':
        - microsimulation-demo-public

    'bioprotocol--*':
        - bioprotocol

    # environment overrides; this have to be at the end of this file

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

    # deprecated: use staging
    '*--continuumtest':
        - environment-continuumtest-public
        - environment-continuumtest

    # deprecated: use staging
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

    # temporary
    'journal--title-length--*':
        - environment-title-length-public

    # temporary
    'journal--pr-*--*':
        - journal-pr-public

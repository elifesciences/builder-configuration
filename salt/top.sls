# minion ids are of the form {project}--{environment}--{node} e.g. elife-bot--end2end--1
# older existing minion ids are of them form {project}--{environment} e.g. elife-bot--prod
base:
    # all projects get these
    '*':
        - elife

    # all "production" servers
    '*--prod--* or *--prod or master-server--2018-04-09-2--*':
        - elife.newrelic-infrastructure
    
    'master-server--2018-04-09-2--*':
        - elife.backups-cron

    # all "non-production" servers
    'not *--prod--* and not *--prod and not master-server--2018-04-09-2--*':
        # temporary. remove once all non-prod instances have infrastructure removed
        - elife.newrelic-infrastructure-removal

    'master-server--*':
        - elife.certificates
        - master-server
        - master-server.vault
        - master-server.salt-vault

    'basebox--*': []
        # basebox is used as a base for other projects
        # put common big and slow deps in here

    'api-gateway--*':
        - elife.postgresql
        - elife.nginx
        - elife.nginx-error-pages
        - elife.certificates
        - api-gateway

    'elife-dashboard--*':
        - elife.python3
        - elife.postgresql
        - elife.nginx
        - elife.uwsgi
        - elife.no-more-daemon
        - elife-dashboard
        - elife-dashboard.uwsgi
        - elife-dashboard.scheduler
        - elife.nodejs6
        - elife-dashboard.dashboard2

    'elife-dashboard--end2end*':
        - elife-dashboard.processes

    'elife-dashboard--continuumtest*':
        - elife-dashboard.processes

    'elife-dashboard--prod*':
        - elife-dashboard.processes

    'elife-arges--*':
        - elife.java8
        - elife.nginx
        - elife.elasticsearch

    'elife-bot--*':
        - elife.redis-server
        - elife.docker
        - elife.newrelic-python
        - elife-bot.strip-coverletter
        - elife-bot
        - elife-bot.feeder

    'elife-bot--ci*':
        - elife.vsftpd

    'elife-bot--end2end*':
        - elife.nginx
        - elife.vsftpd
        - elife.vsftpd-nginx
        - elife-bot.processes
        - elife.sidecars
        - elife.mockserver
        # we don't run crons here as they fill up /tmp quickly with all the deposits of testing articles

    'elife-bot--continuumtest*':
        - elife-bot.processes
        - elife-bot.cron

    'elife-bot--prod*':
        - elife-bot.processes
        - elife-bot.cron

    'elife-api--*':
        - elife.nginx
        - elife.uwsgi
        - elife-api
        - elife-api.uwsgi
        - elife-api.syslog-conf


    'lax--*':
        - elife.python3
        - elife.nginx
        - elife.uwsgi
        - elife.postgresql
        - elife.postgresql-appdb
        - elife.mercurial
        - elife.no-more-daemon
        - elife.newrelic-python
        - elife.external-volume
        - lax
        - lax.uwsgi
        # interesting dependency. bot-lax-adaptor requires reporting
        - elife-reporting
        - lax.adaptors

    'lax--end2end*':
        - lax.processes

    'lax--continuumtest*':
        - lax.processes

    'lax--prod*':
        - lax.processes

    'lax--prod--1':
        - lax.cron
        - elife-reporting.cron

    'journal--*':
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.nginx-error-pages
        - elife.nodejs6
        - elife.newrelic-php
        - journal.curl-7-36
        - journal

    'journal--prod--*':
        - elife.redis-server
        - api-dummy
        - journal.local-demo
        - journal.critical-css

    'journal--demo--*':
        - elife.redis-server
        - api-dummy
        - journal.local-demo
        - journal.critical-css

    'journal--end2end--*':
        - elife.redis-server
        - api-dummy
        - journal.local-demo
        - journal.critical-css

    'journal--continuumtest--*':
        - elife.redis-server
        - api-dummy
        - journal.local-demo
        - journal.critical-css

    'journal--continuumtestpreview--*':
        - elife.redis-server
        - api-dummy
        - journal.local-demo
        - journal.critical-css

    'journal--preview--*':
        - elife.redis-server
        - api-dummy
        - journal.local-demo
        - journal.critical-css

    'pattern-library--*':
        - elife.docker
        - elife.nginx
        - elife.nginx-upgrade-http
        - pattern-library

    'journal-cms--*':
        - elife.external-volume
        - elife.external-volume-srv
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.mysql57
        - elife.redis-server
        - elife.newrelic-php
        - elife.aws-cli
        - journal-cms

    'journal-cms--ci*':
        - api-dummy
        - journal-cms.api-dummy
        - elife.docker
        - elife.goaws
        - elife.swapspace

    'journal-cms--end2end*':
        - journal-cms.cron
        - journal-cms.processes

    'journal-cms--continuumtest*':
        - journal-cms.cron
        - journal-cms.processes

    'journal-cms--prod--*':
        - journal-cms.cron
        - journal-cms.processes
        - elife.postfix # queues then sends via AWS SES
        - elife.postfix-ses
    
    'journal-cms--ckeditor--*':
        - api-dummy
        - journal-cms.api-dummy
        - elife.docker
        - elife.goaws
        - elife.swapspace

    'api-dummy--*':
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.newrelic-php
        - api-dummy
        - api-dummy.nginx

    'elife-metrics--*':
        - elife.no-more-daemon
        - elife.python3
        - elife.nginx
        - elife.uwsgi
        - elife.postgresql
        - elife.postgresql-appdb
        - elife.newrelic-python
        - elife-metrics
        - elife-metrics.uwsgi

    'elife-alfred--*':
        - elife.swapspace
        - elife.java8
        - elife.jenkins-scripts
        - elife.nginx
        - elife.postfix
        - elife.postfix-ses
        - elife.aws-cli
        - elife.external-volume
        - elife-alfred.vault-approle
        - elife.vault-client
        - elife-alfred
        - elife-alfred.postfix
        - elife.hub
        - elife.python3
        - elife.kubectl
        - elife.helm

    'elife-libraries--*':
        - elife.java8
        - elife.php7
        - elife.composer
        - elife.nodejs6
        - elife.python3
        - elife.mercurial
        - elife.aws-cli
        - elife.external-volume
        - elife.mysql57
        - elife.postgresql
        - elife.jenkins-node
        - elife.jenkins-scripts
        - elife.proofreader-php
        - elife.hub
        - elife.docker
        - elife.docker-push
        - elife.pypi
        - elife-libraries

    'elife-libraries--load--*':
        - elife.spectrum

    'elife-libraries--spectrum--*':
        - elife.external-volume-srv
        - elife.docker
        - elife.spectrum

    'containers--*--*':
        - elife.external-volume
        - elife.jenkins-scripts
        - elife.docker
        - elife.docker-push
        - elife.hub
        - elife.jenkins-node
        - elife.aws-cli
        - elife.aws-credentials
        - elife.ssh-credentials
        - elife.vault-client
        - containers
        - elife.pypi

    'crm--*':
        - elife.external-volume
        - elife.postfix # queues then sends via AWS SES
        - elife.postfix-ses
        - elife.mysql-client
        - elife.mysql-server
        - elife.php7
        - elife.composer
        - elife.drush
        - elife.newrelic-php
        - elife.apache
        - elife.apache-php7
        - elife.nodejs6
        - crm
        - crm.syslog-conf
        - crm.civinky
        - crm.civinky-processes


    'elife-civiapi--*':
        - elife.ssmtp
        - elife-civiapi

    'anonymous--*':
        - elife.base
        - elife.deploy-user
        - elife.hostname
        - elife.known-hosts
        - elife.time-correction
        - elife.security
        - elife.logging
        - elife.daily-system-updates
        - elife.swapspace
        - elife.php7
        - elife.composer
        - elife.yamldiff
        - anonymous
        - elife.aws-cli

    'medium--*':
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.mysql-server
        - elife.mysql-client
        - elife.newrelic-php
        - medium

    'medium--ci--*':
        - elife.proofreader-php

    'search--*--1':
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.postgresql
        - elife.gearman
        - elife.newrelic-php
        - elife.aws-credentials
        - elife.aws-cli
        - elife.java8
        - search.elasticsearch
        - search.gearman-persistence
        - search

    # follower nodes
    'search--*':
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.gearman-client-php
        - elife.aws-credentials
        - elife.aws-cli
        - search

    'search--ci--*':
        - api-dummy
        - search.api-dummy
        - elife.proofreader-php
        - elife.docker
        - elife.goaws

    'search--end2end--1':
        - search.processes

    'search--continuumtest--1':
        - search.processes

    'search--prod--1':
        - search.processes

    'recommendations--*':
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.newrelic-php
        - recommendations

    'recommendations--ci*':
        - elife.proofreader-php

    'jats4r-validator--*':
        - elife.java8
        - elife.nginx
        - jats4r-validator

    'statusbase--*':
        - elife.php7
        - elife.composer
        - elife.mysql-client
        - elife.mysql-server
        - elife.nginx
        - elife.nginx-php7
        - statusbase

    'observer--*':
        - elife.uwsgi
        - elife.python3
        - elife.java8
        - elife.nginx
        - elife.postgresql
        - elife.postgresql-appdb
        - elife.newrelic-python
        - observer
        - observer.uwsgi

    'observer--prod--*':
        - observer.cron

    'personalised-covers--*':
        - elife.swapspace
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.redis-server
        - elife.nodejs6
        - personalised-covers.aws
        - personalised-covers
        - elife.newrelic-php

    'personalised-covers--ci*':
        - api-dummy
        - elife.proofreader-php
        - personalised-covers.api-dummy

    'peerscout--*':
        - elife.nginx
        - elife.nodejs6
        - elife.python3
        - elife.postgresql
        - elife.aws-cli
        - elife.external-volume
        - elife.external-volume-srv
        - elife.newrelic-python
        - peerscout.postgres
        - peerscout
    
    'peerscout--prod--*':
        - peerscout.cron

    'iiif--*':
        - elife.nginx
        - elife.uwsgi
        - elife.nginx-upgrade-http
        - elife.external-volume
        - elife.newrelic-python
        - iiif
        - iiif.loris

    'redirects--*':
        - elife.nginx
        - elife.nginx-error-pages
        - redirects

    'profiles--end2end--*':
        - elife.postgresql

    'profiles--prod--*':
        - elife.postgresql

    'profiles--continuumtest--*':
        - elife.postgresql-container
        - elife.postgresql-client

    'profiles--*':
        - elife.python3
        - elife.uwsgi
        - elife.nginx
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker
        - elife.docker-databases
        - elife.sidecars
        - profiles.postgresql
        - profiles

    'annotations--*':
        - elife
        - elife.nginx
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker
        - elife.sidecars
        - annotations
        - annotations.containers

    'digests--*':
        - elife.uwsgi-params
        - elife.nginx
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker
        - elife.docker-databases
        - digests

    'digests--* and not digests--end2end--* and not digests--continuumtest--* and not digests--prod--*':
        - elife.postgresql-container

    'schematron-validator--*':
        - elife
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.java8
        - schematron-validator

    'schematron-validator--ci--*':
        - elife.proofreader-php

    'elife-xpub--*':
        - elife.external-volume
        - elife.docker
        - elife.nginx
        - elife.aws-cli
        - elife.aws-credentials
        - elife-xpub

    'elife-xpub--end2end--1':
        - elife.nginx-public-folders
        - elife.sidecars

    'elife-ink--*':
        - elife.nginx
        - elife.docker
        - elife-ink
        - elife-ink.nginx

    'sciencebeam-texture--*':
        - elife.docker
        - elife.nginx
        - sciencebeam-texture

    'data-pipeline--*':
        - elife
        - elife.java8
        - elife.nginx
        - elife.external-volume
        - elife.docker
        - elife.docker-push
        - data-pipeline.nifi
        - data-pipeline.nifi-registry
        - data-pipeline.ejp-to-json-converter
        - data-pipeline.bigquery-views
        - data-pipeline

    'data-pipeline--prod*':
        - elife.swapspace

    'bastion--*':
        - bastion

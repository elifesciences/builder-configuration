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
        - elife.docker
        - elife.postgresql
        - elife.nginx
        - elife.nginx-error-pages
        - elife.certificates
        # lsh@2020-07, note to self:
        # disable .proxy and .kong and re-enabled api-gateway to revert
        #- api-gateway
        - api-gateway.proxy
        - api-gateway.kong

    'elife-dashboard--*':
        - elife.postgresql-11
        - elife.nginx
        - elife.newrelic-python
        - elife.uwsgi
        - elife-dashboard
        - elife-dashboard.uwsgi
        - elife-dashboard.scheduler
        - elife.nodejs16
        #- elife-dashboard.dashboard2

    'elife-dashboard--end2end*':
        - elife-dashboard.processes

    'elife-dashboard--continuumtest*':
        - elife-dashboard.processes

    'elife-dashboard--prod*':
        - elife-dashboard.processes

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
        - elife.multiservice
        - elife-bot.processes
        - elife.sidecars
        - elife.mockserver
        # we don't run crons here as they fill up /tmp quickly with all the deposits of testing articles

    'elife-bot--continuumtest*':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'elife-bot--prod*':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'lax--*':
        - elife.nginx
        - elife.uwsgi
        - elife.postgresql-11
        - elife.postgresql-appdb
        - elife.newrelic-python
        - elife.external-volume
        - lax
        - lax.uwsgi
        # interesting dependency. bot-lax-adaptor requires reporting
        - elife-reporting
        - lax.adaptors

    'lax--end2end*':
        - elife.multiservice
        - lax.processes

    'lax--continuumtest*':
        - elife.multiservice
        - lax.processes

    'lax--prod*':
        - elife.multiservice
        - lax.processes

    'lax--prod--1':
        - lax.cron
        - elife-reporting.cron

    'journal--*':
        - elife.docker
        - elife.nginx
        - elife.nginx-error-pages
        - journal

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
        - elife.mysql-client
        - elife.mysql-server
        - elife.redis-server
        - elife.newrelic-php
        - elife.aws-cli
        - journal-cms

    'journal-cms--ci*':
        - elife.docker
        - elife.goaws
        - elife.swapspace

    'journal-cms--end2end*':
        - journal-cms.cron
        - elife.multiservice
        - journal-cms.processes

    'journal-cms--continuumtest*':
        - journal-cms.cron
        - elife.multiservice
        - journal-cms.processes

    'journal-cms--prod--*':
        - journal-cms.cron
        - elife.multiservice
        - journal-cms.processes
        - elife.postfix # queues then sends via AWS SES
        - elife.postfix-ses
    
    'journal-cms--ckeditor--*':
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
        - elife.nginx
        - elife.uwsgi
        - elife.postgresql-11
        - elife.postgresql-appdb
        - elife.newrelic-python
        - elife-metrics
        - elife-metrics.uwsgi
        
    'elife-metrics--prod--*':
        - elife.external-volume

    'elife-alfred--*':
        - elife.swapspace
        - elife.java11
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
        - elife.kubectl
        - elife.helm

    'elife-libraries--*':
        - elife.java11
        - elife.php7
        - elife.composer
        - elife.nodejs6
        - elife.aws-cli
        - elife.external-volume
        - elife.mysql-client
        - elife.mysql-server
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
        - elife.java11
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
        - elife.kubectl
        - elife.helm
        - elife.pypi

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

    # 'follower' because it may not have opensearch installed
    'search--*':
        - elife.php7
        - elife.composer
        - elife.nginx
        - elife.nginx-php7
        - elife.gearman-client-php
        - elife.aws-credentials
        - elife.aws-cli
        - search

    # the 'leader' because it has opensearch installed
    'search--*--1':
        - elife.postgresql
        - elife.gearman
        - elife.newrelic-php
        - elife.java8
        - elife.docker
        - elife.swapspace
        - search.opensearch
        - search.gearman-persistence
        - search.leader

    # dev/ci
    # https://docs.saltstack.com/en/latest/topics/targeting/compound.html#targeting-compound
    # you can test this on the salt-master with:
    # $ salt -C 'search--* and not search--end2end--* and not search--continuumtest--* and not search--prod--*' --preview-target
    'search--* and not search--end2end--* and not search--continuumtest--* and not search--prod--*':
        - api-dummy
        - search.api-dummy
        - elife.proofreader-php
        - elife.docker
        - elife.goaws

    'search--end2end--1':
        - elife.multiservice
        - search.processes

    'search--continuumtest--1':
        - elife.multiservice
        - search.processes

    'search--prod--1':
        - elife.multiservice
        - search.processes

    'recommendations--*':
        - elife.nginx
        - elife.docker
        - recommendations

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
        - elife.java8
        - elife.nginx
        - elife.postgresql-11
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
        - elife.docker
        - elife.aws-cli
        - elife.sidecars
        - personalised-covers.localstack

    'personalised-covers--pr-*':
        - api-dummy
        - elife.proofreader-php
        - personalised-covers.api-dummy
        - elife.docker
        - elife.aws-cli
        - elife.sidecars
        - personalised-covers.localstack

    'iiif--*':
        - elife.swapspace
        - elife.nginx
        - elife.external-volume
        - elife.newrelic-python
        - elife.docker
        - iiif.loris-removal
        - iiif
        - iiif.loris-maintenance

    'iiif--devchk*':
        - elife.java8
        - iiif.deviation-checker

    'redirects--*':
        - elife.swapspace
        - elife.nginx
        - elife.nginx-error-pages
        - redirects

    'profiles--end2end--*':
        - elife.postgresql-11

    'profiles--prod--*':
        - elife.postgresql-11

    'profiles--continuumtest--*':
        - elife.postgresql-container

    'profiles--*':
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

    'elife-ink--*':
        - elife.nginx
        - elife.docker
        - elife-ink
        - elife-ink.nginx

    'bastion--*':
        - bastion

    'bioprotocol--*':
        - elife.nginx
        - elife.postgresql
        - elife.postgresql-appdb
        - elife.uwsgi
        - elife.newrelic-python
        - bioprotocol

    'large-repo-wrangler--*':
        - elife.external-volume
        - large-repo-wrangler


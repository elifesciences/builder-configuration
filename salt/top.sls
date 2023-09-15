{% set osrelease = salt['grains.get']('osrelease') %}

# minion ids are of the form {project}--{environment}--{node} e.g. elife-bot--end2end--1
base:
    # all projects get these
    '*':
        - elife
        - elife.newrelic-infrastructure-removal
        - elife.prometheus-node-exporter

    'master-server--prod--*':
        - elife.backups-cron

    'master-server--*':
        - elife.certificates
        - master-server
        - master-server.vault
        - master-server.salt-vault

    'basebox--*': []
        # basebox is used as a base for other projects
        # put common big and slow deps in here

    'api-gateway--*':
        - elife.postgresql-12
        - elife.docker-native
        - elife.nginx
        - elife.nginx-error-pages
        - elife.certificates
        - api-gateway.proxy
        - api-gateway.kong

    'elife-dashboard--*':
        - elife.postgresql-12
        - elife.nginx
        - elife.uwsgi
        - elife-dashboard
        - elife-dashboard.uwsgi
        - elife-dashboard.scheduler
        - elife.nodejs16
        #- elife-dashboard.dashboard2

    'elife-dashboard--end2end--*':
        - elife-dashboard.processes

    'elife-dashboard--continuumtest--*':
        - elife-dashboard.processes

    'elife-dashboard--prod--*':
        - elife-dashboard.processes

    'elife-bot--*':
        - elife.external-volume
        - elife.redis-server
        - elife.docker-native
        - elife.newrelic-python-removal
        - elife-bot.strip-coverletter
        - elife-bot
        - elife-bot.feeder

    'elife-bot--ci--*':
        - elife.vsftpd

    'elife-bot--end2end--*':
        - elife.nginx
        - elife.vsftpd
        - elife.vsftpd-nginx
        - elife.multiservice
        - elife-bot.processes
        - elife.sidecars
        - elife.mockserver
        # we don't run crons here as they fill up /tmp quickly with all the deposits of testing articles

    'elife-bot--continuumtest--*':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'elife-bot--prod--*':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'lax--*':
        - elife.nginx
        - elife.uwsgi
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife.newrelic-python-removal
        - elife.external-volume
        - lax
        - lax.uwsgi
        # interesting dependency. bot-lax-adaptor requires reporting
        - elife-reporting
        - lax.adaptors

    'lax--end2end--*':
        - elife.multiservice
        - lax.processes

    'lax--continuumtest--*':
        - elife.multiservice
        - lax.processes

    'lax--prod--*':
        - elife.multiservice
        - lax.processes

    'lax--prod--1':
        - lax.cron
        - elife-reporting.cron

    'journal--*':
        - elife.docker-native
        - elife.nginx
        - elife.nginx-error-pages
        - journal

    'pattern-library--*':
        - elife.docker-native
        - elife.nginx
        - elife.nginx-upgrade-http
        - pattern-library

    'journal-cms--*':
        - elife.apache-removal # lsh@2022-11-04: temporary, remove once apache2 purged
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

    'journal-cms--ci--*':
        - elife.docker-native
        - elife.goaws
        - elife.swapspace

    'journal-cms--end2end--*':
        - journal-cms.cron
        - elife.multiservice
        - journal-cms.processes

    'journal-cms--continuumtest--*':
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
        - elife.docker-native
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
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife-metrics
        - elife-metrics.uwsgi
        
    'elife-metrics--prod--*':
        - elife.external-volume

    'elife-alfred--*':
        - elife.swapspace
        - elife.java11
        - elife.nodejs16 # for 'npm' and npm releases
        - elife.jenkins-scripts
        - elife.nginx
        - elife.postfix
        - elife.postfix-ses
        - elife.aws-cli
        - elife.external-volume
        - elife.external-volume-srv
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
        - elife.nodejs16
        - elife.aws-credentials
        - elife.aws-cli
        - elife.external-volume
        - elife.mysql-client
        - elife.mysql-server
        - elife.postgresql-12
        - elife.jenkins-node
        - elife.jenkins-scripts
        - elife.hub
        - elife.docker-native
        - elife.docker-push
        - elife.pypi
        - elife-libraries

    'elife-libraries--ci--*':
        # lsh@2023-04-04: todo
        #- elife.external-volume-srv
        - elife-libraries.builder

    'elife-libraries--load--*':
        - elife.spectrum

    'elife-libraries--spectrum--*':
        - elife.external-volume-srv
        - elife.spectrum

    'containers--*':
        - elife.java11
        - elife.external-volume
        - elife.jenkins-scripts
        - elife.docker-native
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
        - elife.postgresql-12
        - elife.gearman
        - elife.newrelic-php
        - elife.java8
        - elife.docker-native
        - elife.swapspace
        - search.opensearch
        - search.gearman-persistence
        - search.leader

    # dev/ci only
    # you can test this on the salt-master with:
    # $ salt -C 'search--* and not search--end2end--* and not search--continuumtest--* and not search--prod--*' --preview-target
    # - https://docs.saltstack.com/en/latest/topics/targeting/compound.html#targeting-compound
    'search--* and not search--end2end--* and not search--continuumtest--* and not search--prod--*':
        - api-dummy
        - search.api-dummy
        - elife.goaws

    # non-dev/non-ci leaders only
    'search--end2end--1 or search--continuumtest--1 or search--prod--1':
        - elife.multiservice
        - search.processes

    'recommendations--*':
        - elife.docker-native
        - elife.nginx
        - recommendations

    'observer--*':
        - elife.uwsgi
        - elife.java8
        - elife.nginx
        - elife.postgresql-12
        - elife.postgresql-appdb
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
        - elife.nodejs16
        - personalised-covers.aws
        - personalised-covers
        - elife.newrelic-php

    'personalised-covers--ci--*':
        - api-dummy
        - personalised-covers.api-dummy
        - elife.docker-native
        - elife.aws-cli
        - elife.sidecars
        - personalised-covers.localstack

    'personalised-covers--pr-*':
        - api-dummy
        - personalised-covers.api-dummy
        - elife.docker-native
        - elife.aws-cli
        - elife.sidecars
        - personalised-covers.localstack

    'iiif--*':
        - elife.swapspace
        - elife.nginx
        - elife.external-volume
        - elife.newrelic-python-removal
        - elife.docker-native
        - iiif
        - iiif.loris-maintenance

    'iiif--devchk--*':
        - elife.java8
        - iiif.deviation-checker

    'redirects--*':
        - elife.swapspace
        - elife.nginx
        - elife.nginx-error-pages
        - redirects

    'profiles--*':
        - elife.postgresql-12
        - elife.uwsgi
        - elife.nginx
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker-native
        - elife.docker-databases
        - elife.sidecars
        - profiles.postgresql
        - profiles

    'annotations--*':
        - elife
        - elife.nginx
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker-native
        - elife.sidecars
        - annotations
        - annotations.containers

    'digests--*':
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife.uwsgi-params
        - elife.nginx
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker-native
        - elife.docker-databases
        - digests

    'bastion--*':
        - elife.swapspace
        - bastion

    'bioprotocol--*':
        - elife.nginx
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife.uwsgi
        - bioprotocol

    'large-repo-wrangler--*':
        - elife.external-volume
        - large-repo-wrangler

    'monitor--*':
        - elife.nginx
        - monitor


{% set osrelease = salt['grains.get']('osrelease') %}

# minion ids are of the form {project}--{environment}--{node} e.g. elife-bot--end2end--1
base:
    # all projects get these
    '*':
        - elife
        - elife.prometheus-node-exporter

    'master-server--prod--* or (G@project:master-server and G@environment:prod)':
        - elife.backups-cron

    'master-server--* or (G@project:master-server)':
        - elife.certificates
        - master-server
        - master-server.vault
        - master-server.salt-vault

    'basebox--* or (G@project:basebox)': []
        # basebox is used as a base for other projects
        # put common big and slow deps in here

    'api-gateway--* or (G@project:api-gateway)':
        - elife.postgresql-12
        - elife.docker-native
        - elife.disable-nginx
        - elife.caddy
        - elife.nginx-error-pages
        - elife.certificates
        - api-gateway.proxy
        - api-gateway.kong

    'elife-dashboard--* or (G@project:elife-dashboard)':
        - elife.postgresql-12
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.uwsgi
        - elife-dashboard
        - elife-dashboard.uwsgi
        - elife-dashboard.scheduler
        - elife.nodejs16
        #- elife-dashboard.dashboard2

    'elife-dashboard--end2end--* or (G@project:elife-dashboard and G@environment:end2end)':
        - elife-dashboard.processes

    'elife-dashboard--continuumtest--* or (G@project:elife-dashboard and G@environment:continuumtest)':
        - elife-dashboard.processes

    'elife-dashboard--prod--* or (G@project:elife-dashboard and G@environment:prod)':
        - elife-dashboard.processes

    'elife-bot--* or (G@project:elife-bot)':
        - elife.external-volume
        - elife.redis-server
        - elife.docker-native
        - elife-bot.strip-coverletter
        - elife-bot
        - elife-bot.feeder

    'elife-bot--ci--* or (G@project:elife-bot and G@environment:ci)':
        - elife.vsftpd

    'elife-bot--end2end--* or (G@project:elife-bot and G@environment:end2end)':
        - elife.nginx
        - elife.vsftpd
        - elife.vsftpd-nginx
        - elife.multiservice
        - elife-bot.processes
        - elife.sidecars
        - elife.mockserver
        # we don't run crons here as they fill up /tmp quickly with all the deposits of testing articles

    'elife-bot--continuumtest--* or (G@project:elife-bot and G@environment:continuumtest)':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'elife-bot--prod--* or (G@project:elife-bot and G@environment:prod)':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'lax--* or (G@project:lax)':
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.uwsgi
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife.external-volume
        - lax
        - lax.uwsgi
        # interesting dependency. bot-lax-adaptor requires reporting
        - elife-reporting
        - lax.adaptors

    'lax--end2end--* or (G@project:lax and G@environment:end2end)':
        - elife.multiservice
        - lax.processes

    'lax--continuumtest--* or (G@project:lax and G@environment:continuumtest)':
        - elife.multiservice
        - lax.processes

    'lax--prod--* or (G@project:lax and G@environment:prod)':
        - elife.multiservice
        - lax.processes

    'lax--prod--1 or (G@project:lax and G@environment:end2end and G@role:leader)':
        - lax.cron
        - elife-reporting.cron

    'journal--* or (G@project:journal)':
        - elife.docker-native
        - elife.nginx
        - elife.nginx-error-pages
        - journal

    'pattern-library--* or (G@project:pattern-library)':
        - elife.docker-native
        #- elife.nginx
        #- elife.nginx-upgrade-http
        - elife.disable-nginx
        - elife.caddy
        - pattern-library

    'journal-cms--* or (G@project:journal-cmd)':
        - elife.swapspace
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
        - elife.aws-cli
        - journal-cms

    'journal-cms--ci--* or (G@project:journal and G@environment:ci)':
        - elife.docker-native
        - elife.goaws

    'journal-cms--end2end--* or (G@project:journal and G@environment:end2end)':
        - journal-cms.cron
        - elife.multiservice
        - journal-cms.processes

    'journal-cms--continuumtest--* or (G@project:journal and G@environment:continuumtest)':
        - journal-cms.cron
        - elife.multiservice
        - journal-cms.processes

    'journal-cms--prod--* or (G@project:journal and G@environment:prod)':
        - journal-cms.cron
        - elife.multiservice
        - journal-cms.processes
        - elife.postfix # queues then sends via AWS SES
        - elife.postfix-ses

    'journal-cms--ckeditor--* or (G@project:journal and G@environment:ckeditor)':
        - elife.docker-native
        - elife.goaws

    'api-dummy--* or (G@project:api-dummy)':
        - elife.php7
        - elife.composer
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.nginx-php7
        - api-dummy
        #- api-dummy.nginx
        - api-dummy.caddy

    'elife-metrics--* or (G@project:elife-metrics)':
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.uwsgi
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife-metrics
        - elife-metrics.uwsgi

    'elife-metrics--prod--* or (G@project:elife-mstrics and G@environment:prod)':
        - elife.external-volume

    'elife-alfred--* or (G@project:elife-alfred)':
        - elife.swapspace
        - elife.java11
        - elife.nodejs16 # for 'npm' and npm releases
        - elife.jenkins-scripts
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
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

    'elife-libraries--* or (G@project:elife-libraries)':
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

    'elife-libraries--ci--* or (G@project:elife-library and G@environment:ci)':
        # lsh@2023-04-04: todo
        #- elife.external-volume-srv
        - elife-libraries.builder

    'elife-libraries--load--* or (G@project:elife-library and G@environment:load)':
        - elife.spectrum

    'elife-libraries--spectrum--* or (G@project:elife-library and G@environment:spectrum)':
        - elife.external-volume-srv
        - elife.spectrum

    'containers--* or (G@project:containers)':
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

    'anonymous--* or (G@project:anonymous)':
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

    'search--* or (G@project:search)':
        - elife.php7
        - elife.composer
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.nginx-php7 # not nginx specific
        - elife.gearman-client-php
        - elife.aws-credentials
        - elife.aws-cli
        - search

    # the 'leader' because it has opensearch installed
    'search--*--1 or (G@project:search and G@role:leader)':
        - elife.postgresql-12
        - elife.gearman
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
    '(search--* and not search--end2end--* and not search--continuumtest--* and not search--prod--*) or (G@project:search and not G@environment:prod and not G@environment:end2end and not G@environment:continuumtest)':
        - api-dummy
        - search.api-dummy
        - elife.goaws

    # non-dev/non-ci leaders only
    'search--end2end--1 or search--continuumtest--1 or search--prod--1  or (G@project:search and (G@environment:prod or G@environment:end2end or G@environment:continuumtest) and G@role:leader)':
        - elife.multiservice
        - search.processes

    'recommendations--* or (G@project:recommendations)':
        - elife.docker-native
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - recommendations

    'observer--* or (G@project:observer)':
        - elife.uwsgi
        - elife.java8
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.postgresql-12
        - elife.postgresql-appdb
        - observer
        - observer.uwsgi

    'observer--prod--* or (G@project:observer and G@environment:prod)':
        - observer.cron

    'personalised-covers--* or (G@project:personalised-covers)':
        - elife.swapspace
        - elife.php7
        - elife.composer
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.nginx-php7 # not nginx-specific
        - elife.redis-server
        - elife.nodejs16
        - personalised-covers.aws
        - personalised-covers

    'personalised-covers--ci--* or (G@project:search and G@environment:ci)':
        - api-dummy
        #- api-dummy.nginx
        - api-dummy.caddy
        - elife.docker-native
        - elife.aws-cli
        - elife.sidecars
        - personalised-covers.localstack

    'personalised-covers--pr-* or (G@project:personalised-covers and G@environment:pr)':
        - api-dummy
        #- api-dummy.nginx
        - api-dummy.caddy
        - elife.docker-native
        - elife.aws-cli
        - elife.sidecars
        - personalised-covers.localstack

    'iiif--* or (G@project:iiif)':
        - elife.swapspace
        - elife.nginx
        - elife.external-volume
        - elife.docker-native
        - iiif
        - iiif.loris-maintenance

    'iiif--devchk--* or (G@project:iiif and G@environment:devchk)':
        - elife.java8
        - iiif.deviation-checker

    'redirects--* or (G@project:redirects)':
        - elife.swapspace
        - elife.disable-nginx
        - elife.caddy
        - elife.webserver-error-pages
        - redirects

    'profiles--* or (G@project:profiles)':
        - elife.postgresql-12
        - elife.uwsgi
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker-native
        - elife.docker-databases
        - elife.sidecars
        - profiles.postgresql
        - profiles

    'annotations--* or (G@project:annotations)':
        - elife
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker-native
        - elife.sidecars
        - annotations
        - annotations.containers

    'digests--* or (G@project:digests)':
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife.uwsgi-params
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.aws-credentials
        - elife.aws-cli
        - elife.docker-native
        - elife.docker-databases
        - digests

    'bastion--* or (G@project:bastion)':
        - elife.swapspace
        - bastion

    'bioprotocol--* or (G@project:bioprotocol)':
        - elife.disable-nginx
        - elife.caddy
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife.uwsgi
        - bioprotocol

    'large-repo-wrangler--* or (G@project:large-repo-wrangler)':
        - elife.external-volume
        - large-repo-wrangler

    'monitor--* or (G@project:monitor)':
        - elife.external-volume
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - monitor

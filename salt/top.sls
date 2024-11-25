{% set osrelease = salt['grains.get']('osrelease') %}

# minion ids are of the form {project}--{environment}--{node} e.g. elife-bot--end2end--1
base:
    # all projects get these
    '*':
        - elife
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
        - elife.disable-nginx
        - elife.caddy
        - elife.nginx-error-pages
        - elife.certificates
        - api-gateway.proxy
        - api-gateway.kong

    'elife-dashboard--*':
        - elife.postgresql-13
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.uwsgi
        - elife-dashboard
        - elife-dashboard.uwsgi
        - elife-dashboard.scheduler
        - elife.nodejs16
        #- elife-dashboard.dashboard2

    'elife-dashboard--continuumtest--*':
        - elife-dashboard.processes

    'elife-dashboard--prod--*':
        - elife-dashboard.processes

    'elife-bot--*':
        - elife.external-volume
        - elife.redis-server
        - elife.docker-native
        - elife-bot.strip-coverletter
        - elife-bot
        - elife-bot.feeder

    'elife-bot--ci--*':
        - elife.vsftpd

    'elife-bot--continuumtest--*':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'elife-bot--prod--*':
        - elife.multiservice
        - elife-bot.processes
        - elife-bot.cron

    'lax--*':
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
        #- elife.nginx
        #- elife.nginx-upgrade-http
        - elife.disable-nginx
        - elife.caddy
        - pattern-library

    'journal-cms--*':
        - elife.swapspace
        - elife.apache-removal # lsh@2022-11-04: temporary, remove once apache2 purged
        - elife.external-volume
        - elife.external-volume-srv
        - elife.php7
        - elife.composer
        - elife.disable-nginx
        - elife.caddy
        - elife.nginx-php7
        - elife.mysql-client
        - elife.mysql-server
        - elife.redis-server
        - elife.aws-cli
        - journal-cms

    'journal-cms--ci--*':
        - elife.docker-native
        - elife.goaws

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

    'elife-metrics--*':
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.uwsgi
        - elife.postgresql-13
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

    'recommendations--*':
        - elife.docker-native
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - recommendations

    'observer--*':
        - elife.uwsgi
        - elife.java8
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - elife.postgresql-13
        - elife.postgresql-appdb
        - observer
        - observer.uwsgi

    'observer--prod--*':
        - observer.cron

    'iiif--*':
        - elife.swapspace
        - elife.nginx
        - elife.external-volume
        - elife.docker-native
        - iiif
        - iiif.loris-maintenance

    'iiif--devchk--*':
        - elife.java8
        - iiif.deviation-checker

    'redirects--*':
        - elife.swapspace
        - elife.disable-nginx
        - elife.caddy
        - elife.webserver-error-pages
        - redirects

    'profiles--*':
        - elife.postgresql-13
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

    'annotations--*':
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

    'digests--*':
        - elife.postgresql-13
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

    'bastion--*':
        - elife.swapspace
        - bastion

    'bioprotocol--*':
        - elife.disable-nginx
        - elife.caddy
        - elife.postgresql-12
        - elife.postgresql-appdb
        - elife.uwsgi
        - bioprotocol

    'large-repo-wrangler--*':
        - elife.external-volume
        - large-repo-wrangler

    'monitor--*':
        - elife.external-volume
        #- elife.nginx
        - elife.disable-nginx
        - elife.caddy
        - monitor

#!/bin/sh
echo https://kifarunix.com/install-logstash-7-on-fedora-30-fedora-29-centos-7/
set -ex
echo 010
# yum install -y java-1.8.0-openjdk.x86_64
echo 020
# rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
echo 030
#cat > /etc/yum.repos.d/elastic-7.x.repo << EOF
#[elasticsearch-7.x]
#name=Elasticsearch repository for 7.x packages
#baseurl=https://artifacts.elastic.co/packages/7.x/yum
#gpgcheck=1
#gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
#enabled=1
#autorefresh=1
#type=rpm-md
#EOF
echo 040
#yum install -y logstash
echo 050
# echo cd /usr/share/logstash/bin/
echo 060
# echo ./logstash -e 'input { stdin { } } output { stdout {} }'
echo 070
# echo vim /etc/logstash/conf.d/ssh-auth-filter.conf
echo 080
#cat > /etc/logstash/conf.d/ssh-authentication.conf.sample << EOF
#input {
#  beats {
#    port => 5044
#  }
#}
#filter {
#  grok {
#    match => { "message" => "%{SYSLOGTIMESTAMP:timestamp}\s+%{IPORHOST:dst_host}\s+%{WORD:syslog_program}\[\d+\]:\s+(?<status>\w+\s+password)\s+for\s+%{USER:auth_user}\s+from\s+%{SYSLOGHOST:src_host}.*" }
#    add_field => { "activity" => "SSH Logins" }
#    add_tag => "linux_auth"
#    }
#}
#output {
#   elasticsearch {
#     hosts => ["localhost:9200"]
#     manage_template => false
#     index => "ssh_auth-%{+YYYY.MM}"
# }
#}
#EOF


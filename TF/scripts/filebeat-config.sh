
#! /bin/bash

filebeatyaml="filebeat.inputs:
- type: filestream
  id: my-filestream-id
  enabled: true
  paths:
    - /var/log/std.log

filebeat.config.modules:
  path: /etc/filebeat/modules.d/*.yml
  reload.enabled: false

setup.template.settings:
  index.number_of_shards: 1

setup.kibana:

output.logstash:
  hosts: ['172.31.13.2:5044']
  
processors:
  - add_host_metadata:
      when.not.contains.tags: forwarded
  - add_cloud_metadata: ~
  - add_docker_metadata: ~
  - add_kubernetes_metadata: ~
  #ignore me"
echo "$filebeatyaml" > /etc/filebeat/filebeat.yml

systemctl start filebeat

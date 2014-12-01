# General settings
#Use json on Opsworks Stack setting to provided attribute information. Attributes can not be nil

default['tomcat-cas']['install_path']='/apps/tomcat-cas'
default['newrelic']['java_agent']['environment']='nil'
default['app']['install_path'] = "/opt"
default['app']['name'] = "test"
default['app']['template'] = "bin/test.sh"


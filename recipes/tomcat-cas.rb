#
# Cookbook Name:: config_newrelic
# Recipe:: default
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#


directory "node['tomcat-cas']['install_path']/temp" do
    owner "node['newrelic']['java_agent']['app_user']"
    group "node['newrelic']['java_agent']['app_user']"
    mode "0755"
    action :create
only_if { File.exist?("node['tomcat-cas']['install_path']") }
end

service 'tomcat-cas' do
    supports :status => true, :restart => true
    provider Chef::Provider::Service::Init
end

template "node['tomcat-cas']['install_path']/bin/catalina.sh" do
    source 'catalina.erb'
    mode 0755
    variables(
              :default_env => node['newrelic']['java_agent']['environment']
              )
              notifies :restart, "service[tomcat-cas]", :immediately
only_if { File.exist?("node['tomcat-cas']['install_path']/tomcat-cas/bin") }
end




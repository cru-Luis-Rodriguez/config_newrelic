#
# Cookbook Name:: config_newrelic
# Recipe:: default
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#

CAS_dir = node['tomcat-cas']['install_path']

directory "#{CAS_dir}/temp" do
    owner "appadmin"
    group "appadmin"
    mode "0755"
    action :create
end

service 'tomcat-cas' do
    supports :status => true, :restart => true
    provider Chef::Provider::Service::Init
end

template "#{CAS_dir}/bin/catalina.sh" do
    source 'catalina.erb'
    mode 0755
    variables(
              :default_env => node['newrelic']['java_agent']['environment']
              )
              notifies :restart, "service[tomcat-cas]", :immediately
end



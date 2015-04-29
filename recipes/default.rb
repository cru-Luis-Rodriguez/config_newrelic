#
# Cookbook Name:: config_newrelic
# Recipe:: default
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#


directory "node['app']['install_path']/node['app']['name']/temp" do
    owner "node['newrelic']['java_agent']['app_user']"
    group "node['newrelic']['java_agent']['app_user']"
    mode "0755"
    action :create
only_if { File.exist?("node['app']['install_path']/node['app']['name']") }
end

service "node['app']" do
    supports :status => true, :restart => true
    provider Chef::Provider::Service::Init
end

template "node['app']['install_path']/node['app']['name']/node['app']['template']" do
    source 'node['app'][template].erb'
    mode 0755
    variables(
              :default_env => node['newrelic']['java_agent']['environment']
              )
              notifies :restart, "service 'node['app']['name']", :immediately
only_if { File.exist?("node['app']['install_path']/node['app']['name']") }
end




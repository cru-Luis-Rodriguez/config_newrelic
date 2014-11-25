#
# Cookbook Name:: config_newrelic
# Recipe:: test
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#
include_recipe "newrelic::default"
include_recipe "tomcat:default"


directory "/apps" do
    owner "node['newrelic']['java_agent']['app_user']"
    group "node['newrelic']['java_agent']['app_user']"
    mode "0755"
    action :create
end

directory "/apps/tomcat-cas" do
    owner "node['newrelic']['java_agent']['app_user']"
    group "node['newrelic']['java_agent']['app_user']"
    mode "0755"
    action :create
end

directory "/apps/tomcat-cas/bin" do
    owner "node['newrelic']['java_agent']['app_user']"
    group "node['newrelic']['java_agent']['app_user']"
    mode "0755"
    action :create
end





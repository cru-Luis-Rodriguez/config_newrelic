#
# Cookbook Name:: config_newrelic
# Recipe:: test
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#
#include_recipe "newrelic::server_monitor_agent"
include_recipe "tomcat6::default"


directory "/apps/tomcat-cas/bin" do
    mode "0755"
    action :create
end





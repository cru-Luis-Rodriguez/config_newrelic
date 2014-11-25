#
# Cookbook Name:: config_newrelic
# Recipe:: test
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#
include_recipe "tomcat6::default"



%w[ /apps /apps/tomcat-cas /apps/tomcat-cas/bin ].each do |path|
   directory path do
	owner 'root'
	group 'root'    
	mode "0755"
    		action :create
   end
end




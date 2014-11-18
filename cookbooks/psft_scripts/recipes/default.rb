#
# Cookbook Name:: psft_scripts
# Recipe:: default
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#
script_dir = node['psft']['script']['install_path']

directory "#{script_dir}/psft_jenkins_scripts" do
    owner "tuxedo"
    group "tuxedo"
    mode "0755"
    action :create
    only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" }
end

directory "#{script_dir}/psft_jenkins_scripts" do
    owner "wladmin"
    group "wladmin"
    mode "0755"
    action :create
    only_if "grep wladmin /etc/passwd", :environment => { 'HOME' => "/home/wladmin" }
end

template "#{script_dir}/psft_jenkins_scripts/boot.sh" do
    source 'boot.erb'
    owner "tuxedo"
    group "tuxedo"
    mode 0755
    variables(
              :domain => node['psft']['domain_name'],
              :env => node['psft']['environment'],
              :ora => node['psft']['oracle_client']['home'],
              :ps_home => node['psft']['home'],
              :tux_dir => node['psft']['tuxedo']['path'],
	      :app => node['psft']['application']
              )
    only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" }
end

template "#{script_dir}/psft_jenkins_scripts/shutdown.sh" do
    source 'shutdown.erb'
    owner "tuxedo"
    group "tuxedo"
    mode 0755
    variables(
              :domain => node['psft']['domain_name'],
              :env => node['psft']['environment'],
              :ora => node['psft']['oracle_client']['home'],
              :ps_home => node['psft']['home'],
              :tux_dir => node['psft']['tuxedo']['path'],
              :app => node['psft']['application']
              )
    only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" }
end

template "#{script_dir}/psft_jenkins_scripts/clear_cache.sh" do
    source 'clear_cache.erb'
    owner "tuxedo"
    group "tuxedo"
    mode 0755
    variables(
              :domain => node['psft']['domain_name'],
              :env => node['psft']['environment'],
              :ora => node['psft']['oracle_client']['home'],
              :ps_home => node['psft']['home'],
              :tux_dir => node['psft']['tuxedo']['path'],
              :app => node['psft']['application']
              )
    only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" } || {node['psft']['application']=>"hr91"}
end  

template "#{script_dir}/psft_jenkins_scripts/web_clear_cache.sh" do
    source 'web_clear_cache.erb'
    owner "wladmin"
    group "wladmin"
    mode 0755
    variables(
              :pia_cache => node['psft']['pia']['cache_path'],
              :path_pia => node['psft']['pia']['path'],
              )
    only_if "grep wladmin /etc/passwd", :environment => { 'HOME' => "/home/wladmin" }
end


if node.chef_environment.include?("ps_hr")
 template "#{script_dir}/psft_jenkins_scripts/proc_boot.sh" do
    source 'proc_boot.erb'
    owner "tuxedo"
    group "tuxedo"
    mode 0755
    variables(
              :domain => node['psft']['domain_name'],
              :env => node['psft']['environment'],
              :ora => node['psft']['oracle_client']['home'],
              :ps_home => node['psft']['home'],
              :tux_dir => node['psft']['tuxedo']['path'],
              :app => node['psft']['application']
              )
    only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" }
 end
end

if node.chef_environment.include?("ps_hr")
 template "#{script_dir}/psft_jenkins_scripts/proc_shutdown.sh" do
    source 'proc_shutdown.erb'
    owner "tuxedo"
    group "tuxedo"
    mode 0755
    variables(
              :domain => node['psft']['domain_name'],
              :env => node['psft']['environment'],
              :ora => node['psft']['oracle_client']['home'],
              :ps_home => node['psft']['home'],
              :tux_dir => node['psft']['tuxedo']['path'],
              :app => node['psft']['application']
              )
    only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" }
  end
end

if node.chef_environment.include?("ps_hr")
 template "#{script_dir}/psft_jenkins_scripts/proc_clear_cache.sh" do
    source 'proc_clear_cache.erb'
    owner "tuxedo"
    group "tuxedo"
    mode 0755
    variables(
              :domain => node['psft']['domain_name'],
              :env => node['psft']['environment'],
              :ora => node['psft']['oracle_client']['home'],
              :ps_home => node['psft']['home'],
              :tux_dir => node['psft']['tuxedo']['path'],
              :app => node['psft']['application']
              )
     only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" } || { node['psft']['application'] => "hr91" }
  end
end

   template "#{script_dir}/psft_jenkins_scripts/ps.sh" do
       source 'ps.erb'
       owner "tuxedo"
       group "tuxedo"
       mode 0755
       variables(
              :app => node['psft']['application'],
              :cg_home => node['psft']['cg_home']
              )
    only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" }
  end

   template "#{script_dir}/psft_jenkins_scripts/start_ps" do
       source 'start_ps.erb'
       owner "tuxedo"
       group "tuxedo"
       mode 0755
       only_if "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" } 
  end

template "#{script_dir}/psft_jenkins_scripts/ps.sh" do
       source 'ps_web.erb'
       owner "wladmin"
       group "wladmin"
       mode 0755
       variables(
              :app => node['psft']['application'],
              :domain => node['psft']['domain_name'],
              :env => node['psft']['environment'],
              :ps_home => node['psft']['home']
              )
    only_if "grep wladmin /etc/passwd", :environment => { 'HOME' => "/home/wladmin" }
  end

   template "#{script_dir}/psft_jenkins_scripts/start_ps" do
       source 'start_ps_web.erb'
       owner "wladmin"
       group "wladmin"
       mode 0755
       only_if "grep wladmin /etc/passwd", :environment => { 'HOME' => "/home/wladmin" }
  end


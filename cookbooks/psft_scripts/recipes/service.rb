#
# Cookbook Name:: psft_scripts
# Recipe:: service
#
# Copyright 2014, cru
#
# All rights reserved - Do Not Redistribute
#

bash 'setup_as_service' do
     if !File.exists?('/etc/init.d/peoplesoft')
        user "root"
	cwd "/etc/init.d"
	code <<-EOH
	ln -s /pshome/psft_jenkins_scripts/start_ps ./peoplesoft;
	chkconfig --add peoplesoft
	EOH
     end
end

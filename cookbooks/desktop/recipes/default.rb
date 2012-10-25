#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# vim
package "vim"

template "/etc/profile.d/vim_alias.sh" do
	mode "0644"
	source "vim_alias.sh.erb"
end

template "/etc/vimrc.local" do
	mode "0644"
	source "vimrc.local.erb"
end

# nginx
include_recipe "nginx"

template "/etc/nginx/sites-available/mirror-8080" do
	mode "0644"
	source "nginx_mirror-8080.erb"
end

nginx_site "mirror-8080" do
	enable true
end

template "/etc/nginx/sites-available/chef-proxy-4040" do
	mode "0644"
	source "nginx_chef-proxy.erb"
end

nginx_site "chef-proxy-4040" do
	enable true
end

# my scripts
directory "/home/choe/bin" do
	owner "choe"
	group "choe"
end

%w{init_chef.sh  mirror-centos.sh  mirror-ubuntu-release.sh  mirror.sh  openstack_manual.sh  screen.sh  sshpass.sh  vmproj.sh}.each do |f|
	template "/home/choe/bin/#{f}" do
		mode "0755"
		owner "choe"
		group "choe"
		source "bin/#{f}"
	end
end

# vim: nu ai ts=4 sw=4

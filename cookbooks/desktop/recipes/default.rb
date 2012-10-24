#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nginx"

template "/etc/vimrc.local" do
	mode "0644"
	source "vimrc.local.erb"
end

package "vim"

template "/etc/profile.d/vim_alias.sh" do
	mode "0644"
	source "vim_alias.sh.erb"
end

# vim: nu ai ts=4 tw=4

#
# Cookbook Name:: wemux
# Recipe:: default
#
# Copyright 2013, Mode Set
#

user = node['wemux_hosts'].first
destination_directory = "/home/#{user}/wemux"

package 'tmux' do
  action :install
end

git destination_directory do
  repository 'git://github.com/zolrath/wemux.git'
  reference 'master'
  user user
end

link "/usr/local/bin/wemux" do
  to "#{destination_directory}/wemux"
end

template "/usr/local/etc/wemux.conf" do
  source "wemux.conf.erb"
  mode '0755'
end

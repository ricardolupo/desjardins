#
# Cookbook Name:: desjardins
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

log 'Apache installed'

template '/var/www/html/index.html' do
  source 'index.html.erb'
  owner 'root'
  group 'root'
  mode 0744
end

log 'Website setup'

service 'httpd' do
  supports status: true
  action [:enable, :start]
end

log "and we're done"

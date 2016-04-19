#
# Cookbook Name:: mail_handler
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2016 ChrisD13
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

chef_gem 'chef-handler-mail' do
  compile_time true
end

require 'chef/handler/mail'

enable_handler = (node['mail_handler']['enable']) ? :enable : :disable
template_path = node['mail_handler']['template_path']

mail_handler_arguments = {
  to_address: node['mail_handler']['to_address'],
  from_address: node['mail_handler']['from_address'],
  send_statuses: node['mail_handler']['send_statuses'],
  hostname: node['mail_handler']['hostname'],
  via: node['mail_handler']['via'],
  via_options: node['mail_handler']['via_options']
}

if !template_path.nil? && File.exist?(template_path)
  mail_handler_arguments['template_path'] = template_path
end

chef_handler 'MailHandler' do
  source 'chef/handler/mail'
  arguments mail_handler_arguments
  action :nothing
end.run_action(enable_handler)

#
# Cookbook Name:: mail_handler
# Attribute:: default
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

default['mail_handler']['enable'] = true
default['mail_handler']['to_address'] = 'root'
default['mail_handler']['from_address'] = "chef-client@#{node.fqdn}"
default['mail_handler']['send_statuses'] = %w(Successful Failed)
default['mail_handler']['hostname'] = node.fqdn
default['mail_handler']['via'] = nil
default['mail_handler']['via_options'] = nil
default['mail_handler']['template_path'] = nil

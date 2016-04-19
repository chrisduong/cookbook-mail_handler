require 'spec_helper'

describe 'mail_handler::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe command('/opt/chef/embedded/bin/gem list') do
    its(:stdout) { should match /chef-handler-mail/ }
  end
end

DNSMADEEASY_GEM_VERSION = '= 0.2.0'.freeze
begin
  gem 'dnsmadeeasy', DNSMADEEASY_GEM_VERSION
rescue LoadError
  unless defined?(ChefSpec)
    run_context = Chef::RunContext.new(Chef::Node.new, {}, Chef::EventDispatch::Dispatcher.new)

    require 'chef/resource/chef_gem'

     dnsmadeeasy = Chef::Resource::ChefGem.new('dnsmadeeasy', run_context)
     dnsmadeeasy.version DNSMADEEASY_GEM_VERSION
     dnsmadeeasy.run_action(:install)
  end
end
# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options
# https://github.com/chef/chef-zero

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
chef_server_url          'http://127.0.0.1:8889'
validation_client_name   'dummyclient'
validation_key           "#{current_dir}/dummyclient.pem"

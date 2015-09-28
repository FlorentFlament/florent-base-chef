#!/usr/bin/env sh

# Upload to the dummy chef server everything required
berks install
berks upload --no-freeze

# Uploading data_bags
for data_bag in $(ls data_bags/); do
  knife data_bag create $data_bag
  for item in $(ls data_bags/${data_bag}/); do
    knife data_bag from file $data_bag $item
  done
done

knife role from file roles/dev_box.json

# Launching chef-client to converge my dev_box
sudo chef-client -c .chef/client.rb -K ~/chef-zero/.chef/dummyclient.pem -r 'role[dev_box]'

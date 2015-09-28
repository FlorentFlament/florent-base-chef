Chef repository to be used for chef-zero provisioning

Usage
=====
* Launch ``chef-zero`` in some terminal

* Populate the dummy chef server:

    berks upload
    knife data bag create users
    knife data bag from file users florent.json
    knife data bag from file users ubuntu.json
    knife role from file roles/dev_box.json

* Launch chef-client

    sudo chef-client -c ~/chef-zero/.chef/client.rb -r 'role[dev_box]'

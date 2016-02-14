#!/bin/sh

# Install Puppet Agent
sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
sudo yum install -y puppet

# Install Apache module from Forge
sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apache

# Set up and apply test module
sudo ln -s /home/vagrant/sync/modules/apacheissue /etc/puppetlabs/code/environments/production/modules/apacheissue
sudo /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/modules/apacheissue/tests/init.pp

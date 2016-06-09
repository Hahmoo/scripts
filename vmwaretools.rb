#!/usr/bin/env ruby

def get_tools_DSA
  puts "Downloading the keys for DSA"
  Dir.chdir "/home/rchow"
  `wget https://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub`
end

def get_tools_RSA
  puts "Downloading the keys for RSA"
  Dir.chdir "/home/rchow"
  `wget https://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub`
end

def install_tools
  puts "adding the VMWARE Packages to repo"
  Dir.chdir "/home/rchow"
  `apt-key add VMWARE-PACKAGING-GPG-DSA-KEY.pub`
  `apt-key add VMWARE-PACKAGING-GPG-RSA-KEY.pub`
end

def create_sources
  puts "Creating the Sources List File."
  Dir.chdir "/home/rchow"
  outfile = File.open('/etc/apt/sources.list.d/vmware-tools.list','w')
  add_repo_info = 'deb http://packages.vmware.com/packages/ubuntu trusty main'
  outfile.puts add_repo_info
  outfile.close
end

def update_repo
  puts "Installing the VMWARE Tools Package."
  `apt-get -y update`
  `apt-get -y install open-vm-tools-deploypkg`
  `apt-get -y upgrade`
end


get_tools_DSA
get_tools_RSA
install_tools
create_sources
update_repo

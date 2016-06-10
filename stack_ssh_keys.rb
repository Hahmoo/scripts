#!/usr/bin/env ruby

sshfile = File.open("~/.ssh/authorized_keys", "w")
ssh_keys = File.open("ssh_keys.txt", "r")

while !ssh_keys.eof?
  line = ssh_keys.readline
  sshfile.puts line
end

sshfile.close
ssh_keys.close 

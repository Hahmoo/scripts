#!/usr/bin/env ruby

hostfile = File.open("/etc/hosts", "w")
dns_file = File.open("dns_hosts.txt", "r")

while !dns_file.eof?
  line = dns_file.readline
  hostfile.puts line
end

hostfile.close
dns_file.close 

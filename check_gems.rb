# encoding: utf-8

require 'pathname'

root = Pathname.new(__FILE__).parent.freeze
malicious_gems_file = root.join('malicious_gems.txt')
gems_lock_file = root.join('Gemfile.lock')

malicious_gems = []
hits = []

malicious_gems_file.read.each_line do |line|
  items = line.split("\t")

  gem = items.first

  unless gem&.empty?
    malicious_gems << gem
  end
end

used_gems = gems_lock_file.read

malicious_gems.each do |malicious_gem|
  if used_gems.include?(malicious_gem)
    hits << malicious_gem
  end
end

if hits.size == 0
  puts 'Cool, the application is not compromised!'
else
  puts 'Whoops, I found one or more malicious Gems in your application:'

  hits.each do |hit|
    puts "  #{hit}"
  end

  puts
  puts 'Please check and fix!'
end

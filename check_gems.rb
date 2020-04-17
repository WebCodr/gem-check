# encoding: utf-8

require 'pathname'

root = Pathname.new(__FILE__).parent.freeze
compromised_gems_file = root.join('compromised_gems.txt')
gems_lock_file = root.join('Gemfile.lock')

compromised_gems = []
hits = []

compromised_gems_file.read.each_line do |line|
  items = line.split("\t")

  gem = items.first

  unless gem&.empty?
    compromised_gems << gem
  end
end

used_gems = gems_lock_file.read

compromised_gems.each do |compromised_gem|
  if used_gems.include?(compromised_gem)
    hits << compromised_gem
  end
end

if hits.size == 0
  puts 'Cool, the application is not compromised!'
else
  puts 'Whoops, I found one or more compromised Gems in your application:'

  hits.each do |hit|
    puts "  #{hit}"
  end

  puts
  puts 'Please check and fix!'
end

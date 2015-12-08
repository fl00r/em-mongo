# Install bson_ext when not on jruby.
unless RUBY_PLATFORM =~ /^java/i
  require 'mkmf'
  require 'rubygems'

  puts %Q{Ruby engine: #{RUBY_ENGINE}}
  puts %Q{The "bson_ext" gem will now be installed. This gem provides a C extension for better performance.}

  Gem.install('bson_ext')
end

# Writes an empty Makefile to pass the native extensions build for
# all rubies.
File.open('Makefile', 'w') do |f|
  f.puts "all:"
  f.puts "\t@true"
  f.puts "install:"
  f.puts "\t@true"
end

# Exit successfully on any ruby.
exit 0

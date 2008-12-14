require 'rubygems'
IRBALIST_ROOT = File.expand_path(File.dirname(__FILE__))

# require all the lib files
$: << IRBALIST_ROOT + "/lib"
Dir.glob(IRBALIST_ROOT + "/lib/*.rb") do |file|
   require file
end

require 'rubygems'
require 'midiator'
IRBAVORE_ROOT = File.expand_path(File.dirname(__FILE__))

# require all the lib files
$: << IRBAVORE_ROOT + "/lib"
Dir.glob(IRBAVORE_ROOT + "/lib/*.rb") do |file|
   require file
end

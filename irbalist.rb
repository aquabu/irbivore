require 'rubygems'
IRBALIST_ROOT = File.expand_path(File.dirname(__FILE__))
Dir.glob(IRBALIST_ROOT + "/lib/*.rb") do |file| 
    require file 
end 

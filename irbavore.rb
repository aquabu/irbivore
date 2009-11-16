require 'irb'
require 'irb/completion'
require 'init.rb'

include MIDIator::Notes
include Irbavore::Livecoding
include Irbavore::Patterns
setup # initialize MIDIator::Notes MIDI connection 

IRB.start

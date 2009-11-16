require 'irb'
require 'irb/completion'
require 'init.rb'

include MIDIator::Notes
include Irbivore::Livecoding
include Irbivore::Patterns
setup # initialize MIDIator::Notes MIDI connection 

IRB.start

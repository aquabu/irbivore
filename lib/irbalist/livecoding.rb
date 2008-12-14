# Irb command line methods
module Livecoding
  def included base
    setup
  end
  def setup 
    @midi = MIDIator::Interface.new
    @midi.autodetect_driver
    @midi.instruct_user!
  end
  
  def p(*args)
    @midi.play *args
  end
end

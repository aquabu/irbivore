# Irb command line methods
module Livecoding
  def included base
    setup
  end

  def setup 
    @midi = MIDIator::Interface.new
    @midi.autodetect_driver
    @midi.instruct_user!
    @bpm = 120 
  end
  
  # play midi note
  # takes note, duration, channel, velocity
  def p(*args)
    Thread.new { @midi.play *args }
  end
end

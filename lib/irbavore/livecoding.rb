# Irb command line methods
module Irbavore::Livecoding
  require "highline/system_extensions"
  include HighLine::SystemExtensions

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
    @midi.play *args
  end

  # play keyboard like an instrument
  def a
    done = nil
    puts "Play ASCII music. To end type <esc>."
    while(done != "\e")
      char = get_character
      Thread.new {p KEYMAP[char.chr]}
      # print char.chr
      done = char.chr
    end
  end


  def self.make_keymap(array, spacing, add = 60)
    keymap = {}
    array.each_with_index do |a, i|
      keymap.merge!(a.to_s => (i * spacing + add) )
    end
    keymap
  end

  ROWZ = %w{z x c v b n m , . /}
  ROWA = %w{a s d f g h j k l ; '}
  ROWQ = %w{q w e r t y u i o p [ ] }
  ROW1 = %w{1 2 3 4 5 6 7 8 9 0 - = }
  ROWGAP = 5 
  SPACING = 1 
  count = 0
  KEYMAP = [ROWZ, ROWA, ROWQ, ROW1].inject({}) do |h, e|
    this_map = make_keymap(e, SPACING, (36 + (ROWGAP * count)))
    count += 1
    h.merge(this_map)
  end
end

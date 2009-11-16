# Irb command line methods
module Irbivore::Livecoding
  require "highline/system_extensions"
  include HighLine::SystemExtensions
 
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

  def included(base)
    setup
  end

  def setup
    @midi = MIDIator::Interface.new
    # @midi.autodetect_driver
    @midi.use :dls_synth
    @midi.instruct_user!
    @midi.instruct_user!
    @bpm = 120
  end

  # play midi note
  # takes note, duration, channel, velocity
  def play(*args)
    @midi.play *args
    true
  end

  # play keyboard like an instrument
  def midiator_keys
    puts "Play ASCII music. To end type <esc>."
    loop do
      char = get_character.chr
      print char

      Thread.new {play(KEYMAP[char])} unless skip?(char) # the threading helps the print display
      return if escape(char)
    end

  end

  def escape(key)
    key == "\e"
  end

  # skips midiator_keys that should not play anything (ie. are not defined)
  def skip?(char)
    !KEYMAP.include? char
  end
end

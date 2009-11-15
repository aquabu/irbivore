require '../init.rb'
include MIDIator::Notes
include Irbavore::Livecoding
include Irbavore::Patterns
setup # initialize MIDIator::Notes MIDI connection 


gagaku = [1,4,2,1,3,1]
anchor = 0 

def rest(int=1)
  sleep 0.07 * int 
end

loop do
  gagaku[0,rand((gagaku.length) -1)].each do |e|
    # anchor += gagaku[rand(gagaku.length - 1)] * [1,-1][rand(2)]
      anchor += e #* [1,-1][rand(2)]
      # anchor += e #* [1,-1][rand(2)]
      Thread.new {p ((anchor % 48) + 48) }
    rest 
  end
end



require File.join( File.dirname(__FILE__), 'lib', 'spec_helper.rb' )
describe Livecoding do
  before :all do
    include Livecoding
  end
  
  it "should generate keymaps" do
    Livecoding.make_keymap(Livecoding::ROWZ, 2, 36).should == {"v"=>42, ","=>50, "m"=>48, "b"=>44, "x"=>38, "."=>52, "n"=>46, "c"=>40, "/"=>54, "z"=>36}
  end
  
  it "should generate keymaps with numberic keys" do
    Livecoding.make_keymap(Livecoding::ROW1, 2, 36).should == {"6"=>46, "7"=>48, "-"=>56, "8"=>50, "9"=>52, "0"=>54, "1"=>36, "="=>58, "2"=>38, "3"=>40, "4"=>42, "5"=>44} 
  end

  it "should define KEYMAP" do
    Livecoding::KEYMAP.should_not == {}
  end
end
require File.join( File.dirname(__FILE__), '..', 'spec_helper.rb' )
describe Irbivore::Livecoding do
  describe "keymap" do
    it "should generate keymaps" do
      hash = {"v"=>42, ","=>50, "m"=>48, "b"=>44, "x"=>38, "."=>52, "n"=>46, "c"=>40, "/"=>54, "z"=>36}
      Irbivore::Livecoding.make_keymap(Irbivore::Livecoding::ROWZ, 2, 36).should == hash
    end

    it "should generate keymaps with numberic keys" do
      hash = {"6"=>46, "7"=>48, "-"=>56, "8"=>50, "9"=>52, "0"=>54, "1"=>36, "="=>58, "2"=>38, "3"=>40, "4"=>42, "5"=>44}
      Irbivore::Livecoding.make_keymap(Irbivore::Livecoding::ROW1, 2, 36).should ==  hash
    end

    it "should define KEYMAP" do
      Irbivore::Livecoding::KEYMAP.should_not == {}
    end
  end
end

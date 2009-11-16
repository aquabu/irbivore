require File.join( File.dirname(__FILE__), '..', 'spec_helper.rb' )
describe Irbivore::Livecoding do
  include Irbivore::Livecoding

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

  describe "skip?" do
    it "returns for false for keys in the keymap" do
      skip?("a").should be_false
    end
    
    it "returns true for keys that are not in the keymap" do
      skip?(" ").should be_true
    end
  end

  describe "escape" do
    it "returns true if it receives the escape key" do
      escape("\e").should == true
    end

    it "returns false if it receives a non escape key" do
      escape("a").should == false
    end
  end

  describe "keys" do
    before do
      self.should_receive(:print).and_return(true)
      self.should_receive(:escape).and_return(true) #exit the loop after one time through
    end

    context "with a keymapped character" do
      before do
        self.should_receive(:play).and_return(true)
      end

      it "calls play" do
        self.should_receive(:get_character).and_return(97) # 97 is a lowercase a
        keys
      end
    end

    context "without a keymapped character" do
      before do
        self.should_receive(:get_character).and_return(126) # 126 is th ~ (tilda) character
      end

      it "does not call play" do
        self.should_not_receive(:play)
        keys
      end
    end
  end
end

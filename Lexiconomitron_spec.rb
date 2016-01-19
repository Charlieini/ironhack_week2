require 'RSpec'
require './Lexiconomitron'

  RSpec.describe "#Lexiconomitron" do

    it "removes every letter t from the input" do
      @lexi = Lexiconomitron.new
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end

end
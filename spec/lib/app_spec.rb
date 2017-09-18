require 'spec_helper'
require 'app'

describe App do

  describe "run" do
    context "player 1 wins" do
      it "returns 1" do
        hands = ["8C TS KC 9H 4S 7D 2S 5D 3S AC",
                "4C 4S 4H 4D 5C 7D 2S 5D 3S AC",
        ].join("\n")
        wins = App.run(io: StringIO.new(hands))
        expect(wins).to eql 1
      end
    end

  end
end

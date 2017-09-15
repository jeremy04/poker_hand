require 'spec_helper'
require 'high_card'

describe HighCard do
  subject { HighCard.new }
  describe "#flopped?" do
    context "player 1 gets has highest card" do
      it "returns winner" do
        player_1 = ["2H","3H","6S","7H","KH"]
        player_2 = ["3H","8D","JS","9C","QC"]
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end
    
    context "player 2 gets a highest card" do
      it "returns winner" do
        player_1 = ["3H","8D","JS","9C","QC"]
        player_2 = ["2H","3H","6S","7H","KH"]
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    # well what happens even though its not in the file??
    context "player 1 and player 2 have same high card" do
      it "returns nil" do
        player_1 = ["3H","8D","JS","9C","KC"]
        player_2 = ["2H","3H","6S","7H","KH"]
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

  end
end

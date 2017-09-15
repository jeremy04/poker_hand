require 'spec_helper'
require 'straight_flush'

describe StraightFlush do
  subject { StraightFlush.new }
  describe "#flopped?" do
    context "Nobody got a straight flush" do
      it "returns nil" do
        player_1 = ["10C","JH","QC","KH","AH"]
        player_2 = ["9H","9D","9S","9C","10C"]
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets a straight flush" do
      it "returns winner" do
        player_1 = ["9H","10H","JH","QH","KH"]
        player_2 = ["9H","9D","9S","9C","10C"]
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end
    
    context "player 2 gets a straight flush" do
      it "returns winner" do
        player_1 = ["9H","9D","9S","9C","10C"]
        player_2 = ["6H","7H","8H","9H","10H"]
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    # Possible but not likely
    # a royal flush is a straight flush but a special kind of straight flush
    # but lets not worry as long as we check royal first
    context "player 1 and player 2 get a straight flush" do
      it "returns nil" do
        player_1 = ["10D","JD","QD","KD","AD"]
        player_2 = ["10H","JH","QH","KH","AH"]
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

  end
end

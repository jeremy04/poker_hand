require 'spec_helper'
require 'royal_flush'

describe RoyalFlush do
  describe "#flopped?" do
    context "Nobody got a royal flush" do
      it "returns nil" do
        player_1 = ["10C","JH","QH","KH","AH"]
        player_2 = ["9H","9D","9S","9C","10C"]
        strategy = RoyalFlush.new
        expect(strategy.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets a royal flush" do
      it "returns winner" do
        player_1 = ["10H","JH","QH","KH","AH"]
        player_2 = ["9H","9D","9S","9C","10C"]
        strategy = RoyalFlush.new
        expect(strategy.flopped?(player_1, player_2)).to eql player_1
      end
    end
    
    context "player 2 gets a royal flush" do
      it "returns winner" do
        player_1 = ["9H","9D","9S","9C","10C"]
        player_2 = ["10H","JH","QH","KH","AH"]
        strategy = RoyalFlush.new
        expect(strategy.flopped?(player_1, player_2)).to eql player_2
      end
    end

    # Possible but not likely
    context "player 1 and player 2 get a royal flush" do
      it "returns nil" do
        player_1 = ["10D","JD","QD","KD","AD"]
        player_2 = ["10H","JH","QH","KH","AH"]
        strategy = RoyalFlush.new
        expect(strategy.flopped?(player_1, player_2)).to be_nil
      end
    end

  end
end

require 'spec_helper'
require 'four_of_kind'

describe FourOfKind do
  subject { FourOfKind.new }
  describe "#flopped?" do
    context "Nobody got a four of a kind" do
      it "returns nil" do
        player_1 = ["10C","JH","QH","KH","AH"]
        player_2 = ["8H","9D","9S","9C","10C"]
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets a four of a kind" do
      it "returns winner" do
        player_1 = ["10H","JH","QH","KH","AH"]
        player_2 = ["9H","9D","9S","9C","10C"]
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end
    
    context "player 2 gets a four of a kind" do
      it "returns winner" do
        player_1 = ["KH","KD","KS","KC","10C"]
        player_2 = ["10H","JH","QH","KH","AH"]
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end

    context "player 1 and player 2 get four of kind" do
      it "returns highest four of a kind" do
        player_1 = ["9H","9D","9S","9C","AD"]
        player_2 = ["10H","10D","10S","10C","AH"]
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end


  end
end

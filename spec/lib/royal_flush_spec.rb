require 'spec_helper'
require 'royal_flush'
require 'card'

describe RoyalFlush do
  subject { RoyalFlush.new }
  describe "#flopped?" do
    context "Nobody got a royal flush" do
      it "returns nil" do
        player_1 = ["TC","JH","QH","KH","AH"].map { |c| Card.new(c) }
        player_2 = ["9H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets a royal flush" do
      it "returns winner" do
        player_1 = ["TH","JH","QH","KH","AH"].map { |c| Card.new(c) }
        player_2 = ["9H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end
    
    context "player 2 gets a royal flush" do
      it "returns winner" do
        player_1 = ["9H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        player_2 = ["TH","JH","QH","KH","AH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    # Possible but not likely
    context "player 1 and player 2 get a royal flush" do
      it "returns nil" do
        player_1 = ["TD","JD","QD","KD","AD"].map { |c| Card.new(c) }
        player_2 = ["TH","JH","QH","KH","AH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

  end
end

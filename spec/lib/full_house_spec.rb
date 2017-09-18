require 'spec_helper'
require 'full_house'
require 'card'

describe FullHouse do
  subject { FullHouse.new }
  describe "#flopped?" do
    context "Nobody got full house" do
      it "returns nil" do
        player_1 = ["TH","TD","TS","2C","9H"].map { |c| Card.new(c) }
        player_2 = ["8H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets full house" do
      it "returns winner" do
        player_1 = ["TH","TD","TS","9C","9H"].map { |c| Card.new(c) }
        player_2 = ["8H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end

    context "player 2 gets a full house" do
      it "returns winner" do
        player_1 = ["KH","KD","KS","KC","TC"].map { |c| Card.new(c) }
        player_2 = ["TH","TD","10S","9C","9H"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    context "player 1 and player 2 get full house" do
      it "returns highest four of a kind" do
        player_1 = ["TH","TD","TS","KC","KD"].map { |c| Card.new(c) }
        player_2 = ["TH","TD","TS","AC","AH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end
  end
end

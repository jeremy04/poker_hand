require 'spec_helper'
require 'two_pair'
require 'card'

describe TwoPair do
  subject { TwoPair.new }
  describe "#flopped?" do
    context "Nobody got two pair" do
      it "returns nil" do
        player_1 = ["TH","TD","TS","2C","9H"].map { |c| Card.new(c) }
        player_2 = ["8H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets two pair" do
      it "returns winner" do
        player_1 = ["TH","TD","5S","9C","9H"].map { |c| Card.new(c) }
        player_2 = ["8H","9D","5S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end

    context "player 2 gets a two pair" do
      it "returns winner" do
        player_1 = ["KH","6D","TS","5C","TC"].map { |c| Card.new(c) }
        player_2 = ["TH","TD","3S","9C","9H"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    context "player 1 and player 2 get two pair" do
      it "returns highest two pair" do
         player_1 = ["TH","TD","5S","9C","9H"].map { |c| Card.new(c) }
         player_2 = ["AH","AD","3S","9C","9H"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end
  end
end

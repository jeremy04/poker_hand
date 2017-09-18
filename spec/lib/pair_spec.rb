require 'spec_helper'
require 'pair'
require 'card'

describe Pair do
  subject { Pair.new }
  describe "#flopped?" do
    context "Nobody got two pair" do
      it "returns nil" do
        player_1 = ["TH","TD","TS","2C","9H"].map { |c| Card.new(c) }
        player_2 = ["8H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets pair" do
      it "returns winner" do
        player_1 = ["TH","8D","5S","9C","9H"].map { |c| Card.new(c) }
        player_2 = ["8H","3D","5S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end

    context "player 2 gets a pair" do
      it "returns winner" do
        player_1 = ["KH","6D","9S","5C","TC"].map { |c| Card.new(c) }
        player_2 = ["TH","6D","3S","9C","9H"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    context "player 1 and player 2 get pair" do
      it "returns highest pair" do
        player_1 = ["5H","KS","9C","7D","9H"].map { |c| Card.new(c) }
        player_2 = ["8H","3S","5D","5C","AH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end

      it "returns highest kicker when tied" do
        player_1 = ["AH","AD","5S","8C","9H"].map { |c| Card.new(c) }
        player_2 = ["AH","AD","3S","8C","9H"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end
  end
end

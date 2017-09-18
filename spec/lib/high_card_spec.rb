require 'spec_helper'
require 'high_card'
require 'card'

describe HighCard do
  subject { HighCard.new }
  describe "#flopped?" do
    context "player 1 gets has highest card" do
      it "returns winner" do
        player_1 = ["2H","3H","6S","7H","KH"].map { |c| Card.new(c) }
        player_2 = ["3H","8D","JS","9C","QC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end
    
    context "player 2 gets a highest card" do
      it "returns winner" do
        player_1 = ["3H","8D","JS","9C","QC"].map { |c| Card.new(c) }
        player_2 = ["2H","3H","6S","7H","KH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    context "player 1 and player 2 have same high card" do
      it "returns 2nd highest high card" do
        player_1 = ["3H","8D","JS","9C","KC"].map { |c| Card.new(c) }
        player_2 = ["2H","3H","6S","7H","KH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end

  end
end

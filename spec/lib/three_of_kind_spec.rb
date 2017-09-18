require 'spec_helper'
require 'three_of_kind'
require 'card'

describe ThreeOfKind do
  subject { ThreeOfKind.new }
  describe "#flopped?" do
    context "player 1 gets has highest card" do
      it "returns winner" do
        player_1 = ["2H","7D","7S","7H","KH"].map { |c| Card.new(c) }
        player_2 = ["3H","8D","JS","9C","QC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end
    
    context "player 2 gets a highest card" do
      it "returns winner" do
        player_1 = ["3H","8D","JS","9C","QC"].map { |c| Card.new(c) }
        player_2 = ["2H","7D","7S","7H","KH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    context "player 1 and player 2 both have 3 of kind" do
      it "returns highest three of kind" do
        player_1 = ["3H","9D","9S","9C","KC"].map { |c| Card.new(c) }
        player_2 = ["2H","7D","7S","7H","KH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end

      it "returns 2nd best when same 3 of kind" do
        player_1 = ["3H","9D","9S","9C","KC"].map { |c| Card.new(c) }
        player_2 = ["2H","9D","9S","9H","QH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end

  end
end

require 'spec_helper'
require 'straight'
require 'card'

describe Straight do
  subject { Straight.new }
  describe "#flopped?" do
    context "Nobody got a straight" do
      it "returns nil" do
        player_1 = ["TC","3H","QC","KH","AH"].map { |c| Card.new(c) }
        player_2 = ["9H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

    context "player 1 gets a straight" do
      it "returns winner" do
        player_1 = ["9H","TD","JS","QC","KH"].map { |c| Card.new(c) }
        player_2 = ["9H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_1
      end
    end

    context "player 2 gets a straight" do
      it "returns winner" do
        player_1 = ["9H","9D","9S","9C","TC"].map { |c| Card.new(c) }
        player_2 = ["6H","7D","8S","9C","TH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    context "player 1 and player 2 get a straight" do
      it "returns player 2 for the high card tie" do
        player_1 = ["9D","TD","JD","QD","KD"].map { |c| Card.new(c) }
        player_2 = ["TH","JH","QH","KH","AH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to eql player_2
      end
    end

    context "player 1 and player 2 get a flush" do
      it "return nil for split pot" do
        player_1 = ["TD","JD","QD","KD","AD"].map { |c| Card.new(c) }
        player_2 = ["TH","JH","QH","KH","AH"].map { |c| Card.new(c) }
        expect(subject.flopped?(player_1, player_2)).to be_nil
      end
    end

  end
end

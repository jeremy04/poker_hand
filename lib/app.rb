require 'pp'
require './lib/royal_flush'
require './lib/straight_flush'
require './lib/four_of_kind'
require './lib/full_house'
require './lib/flush'
require './lib/player'

class App
  RANKINGS = [RoyalFlush, StraightFlush, FourOfKind, FullHouse, Flush]

  def self.run(io: File.open("./lib/poker.txt","r"))
    wins = 0
    io.each do |line|
      hand = line.split
      player1_hand = hand[0..4]
      player2_hand = hand[5..10]

      RANKINGS.each do |ranking|
        ranking = ranking.new
        player1 = Player.new(id: 1, cards: player1_hand)
        player2 = Player.new(id: 2, cards: player2_hand)

        if winner = ranking.flopped?(player1.cards, player2.cards)
          wins += 1 if winner == player1.cards
          next
        end
      end
    end
    wins
  end
end

# Spades
# Hearts
# Clubs
# Dimaonds


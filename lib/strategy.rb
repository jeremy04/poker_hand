require 'pp'
require './lib/royal_flush'
require './lib/straight_flush'
require './lib/four_of_kind'

wins = 0
File.open("./lib/poker.txt","r").each do |line|
  hand = line.split
  player_1 = hand[0..4]
  player_2 = hand[5..10]
  strategies = [RoyalFlush, StraightFlush, FourOfKind]

  strategies.each do |strategy|
    s = strategy.new
    if winner = s.flopped?(player_1, player_2)
      wins += 1 if winner == player_1
      next
    end
  end
end

puts wins
# Spades
# Hearts
# Clubs
# Dimaonds


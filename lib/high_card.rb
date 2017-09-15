require 'byebug'

class HighCard
  
  FACE_CARDS = { "T": 10, "J": 11, "Q": 12, "K": 13, "A": 14 }

  attr_reader :winner

  def flopped?(player1, player2)
    @winner = check_hand(player1, player2)
    @winner
  end

  private

  def check_hand(player1, player2)
    p1_cards = player1.map { |x| x.chars[0...-1].join }.map { |num| FACE_CARDS.fetch(num.to_sym, num).to_i }.sort
    p2_cards = player2.map { |x| x.chars[0...-1].join }.map { |num| FACE_CARDS.fetch(num.to_sym, num).to_i }.sort
    p1_high = p1_cards.max
    p2_high = p2_cards.max
    return nil if p1_high == p2_high
    p1_high > p2_high ? player1 : player2
  end

end

require './lib/high_card'

class TwoPair
  
  attr_reader :winner

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    if check_hand(player1) && check_hand(player2)
      @winner = get_two_pair(player1).max > get_two_pair(player2).max ? player1 : player2
      @winner = HighCard.new.flopped?(player1, player2) if get_two_pair(player1) == get_two_pair(player2)
    end
    @winner
  end

  private

  def get_two_pair(cards)
    numbers = cards.map { |card| card.number }
    numbers.uniq.select { |num| numbers.count(num) == 2 }
  end

  def check_hand(cards)
    numbers = cards.map { |card| card.number }
    numbers.uniq.select { |num| numbers.count(num) == 2 }.size == 2 
  end

end

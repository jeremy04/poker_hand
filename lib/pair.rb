require './lib/high_card'

class Pair
  
  attr_reader :winner

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    if check_hand(player1) && check_hand(player2)
      @winner = get_pair(player1) > get_pair(player2) ? player1 : player2
      @winner = HighCard.new.flopped?(player1, player2) if get_pair(player1) == get_pair(player2)
    end
    @winner
  end

  private

  def get_pair(cards)
    numbers = cards.map { |card| card.number }
    numbers.uniq.select { |num| numbers.count(num) == 2 }.first 
  end

  def check_hand(cards)
    numbers = cards.map { |card| card.number }
    numbers.uniq.select { |num| numbers.count(num) == 2 }.size == 1 
  end

end

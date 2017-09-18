require './lib/high_card'

class Straight

  attr_reader :winner

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    if check_hand(player1) && check_hand(player2)
      @winner = HighCard.new.flopped?(player1, player2)
    end
    @winner
  end

  private

  def get_numbers(cards)
    numbers = cards.map { |card| card.number }
  end

  def check_hand(cards)
    numbers = get_numbers(cards)
    numbers == (numbers.min..numbers.max).to_a   
  end

end

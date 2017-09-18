class Straight

  attr_reader :winner

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    if check_hand(player1) && check_hand(player2)
      high_card = (get_numbers(player1) + get_numbers(player2) ).uniq.max
      return nil if get_numbers(player1).include?(high_card) && get_numbers(player2).include?(high_card)
      @winner = get_numbers(player1).include?(high_card) ? player1 : player2
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

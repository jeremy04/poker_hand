class StraightFlush
  
  attr_reader :winner

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    @winner = nil if check_hand(player1) && check_hand(player2)
    @winner
  end

  private

  def check_hand(cards)
    numbers = cards.map { |card| card.number }
    numbers == (numbers.min..numbers.max).to_a && cards.all? { |card| cards.first.same_suite?(card) }
  end

end

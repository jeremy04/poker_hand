require './lib/high_card'

class Flush

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
    cards.all? { |card| cards.first.same_suite?(card) }
  end

end

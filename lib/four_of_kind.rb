class FourOfKind
  
  attr_reader :winner

  FACE_CARDS = {"T": 10, "J": 11, "Q": 12, "K": 13, "A": 14 }

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    if check_hand(player1) && check_hand(player2)
      @winner = get_four_kind(player1) > get_four_kind(player2) ? player1 : player2
    end
    @winner
  end

  private

  def get_four_kind(cards)
    numbers = cards.map { |card| card.number }
    numbers.uniq.select { |num| numbers.count(num) == 4 }.first
  end

  def check_hand(cards)
    numbers = cards.map { |card| card.number }
    numbers.uniq.any? { |num| numbers.count(num) == 4 }
  end

end

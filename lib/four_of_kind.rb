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

  def tie_breaker(player1, player2)
    numbers = player1.map { |x| x.chars[0...-1].join }
    numbers.uniq.select { |x| numbers.count(x) == 4 }.first
  end
  
  def get_four_kind(player)
    numbers = player.map { |x| x.chars[0...-1].join }
    numbers = numbers.map { |num| FACE_CARDS.fetch(num.to_sym, num).to_i }.sort
    numbers.uniq.select { |x| numbers.count(x) == 4 }.first
  end

  def check_hand(player)
    numbers = player.map { |x| x.chars[0...-1].join }
    numbers.uniq.any? { |x| numbers.count(x) == 4 }
  end

end

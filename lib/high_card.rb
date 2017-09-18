class HighCard
  
  attr_reader :winner

  def flopped?(player1, player2)
    highest = highest(get_numbers(player1), get_numbers(player2))
    return nil if highest.nil?
    @winner = player1 if get_numbers(player1).include?(highest.first)
    @winner = player2 if get_numbers(player2).include?(highest.first)
    @winner
  end

  def highest(a, b)
    a = a.sort.reverse
    b = b.sort.reverse
    return nil if a.first.nil? && b.first.nil?
    return a if a.first > b.first
    return b if b.first > a.first
    if a.first == b.first
      a.shift
      b.shift
      highest(a, b)
    end
  end

  private

  def get_numbers(cards)
    numbers = cards.map { |card| card.number }
  end

end

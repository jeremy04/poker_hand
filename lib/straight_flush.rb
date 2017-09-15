class StraightFlush
  
  FACE_CARDS = { "T": 10, "J": 11, "Q": 12, "K": 13, "A": 14 }

  attr_reader :winner

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    @winner = nil if check_hand(player1) && check_hand(player2)
    @winner
  end

  private

  def check_hand(player)
    suites = player.map { |card| card.chars.last }
    numbers = player.map { |x| x.chars[0...-1].join }
    numbers = numbers.map { |num| FACE_CARDS.fetch(num.to_sym, num).to_i }.sort
    numbers == (numbers.min..numbers.max).to_a && suites.all? { |suite| suites.first == suite }
  end

end

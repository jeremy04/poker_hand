class RoyalFlush
  NUMBER_PATTERN = ["T","J","Q","K","A"]

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
    (NUMBER_PATTERN - numbers).empty? && suites.all? { |suite| suites.first == suite }
  end

end

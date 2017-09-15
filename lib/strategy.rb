hand = "8C TS KC 9H 4S 7D 2S 5D 3S AC".split
player_1 = hand[0..4]
player_2 = hand[5..10]

STRATEGIES = [RoyalFlush, StraightFlush, FourOfKind, FullHouse]

# Spades
# Hearts
# Clubs
# Dimaonds

class RoyalFlush
  NUMBER_PATTERN = ["10","J","Q","K","A"]

  attr_reader :winner
  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    @winner = nil if check_hand(player1) && check_hand(player2)
    @winner
  end

  def check_hand(player)
    suites = player.map { |card| card.chars.last }
    numbers = player.map { |x| x.chars[0...-1].join }
    (NUMBER_PATTERN - numbers).empty? && suites.all? { |suite| suites.first == suite }
  end

end



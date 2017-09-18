require './lib/high_card'

class FullHouse

  attr_reader :winner

  def flopped?(player1, player2)
    @winner = player1 if check_hand(player1)
    @winner = player2 if check_hand(player2)
    if check_hand(player1) && check_hand(player2)
      @winner = ThreeOfKind.new.flopped?(player1, player2)
    end
    @winner
  end

  private

  def check_hand(cards)
    numbers = cards.map { |card| card.number }
    three_kind = numbers.uniq.select { |num| numbers.count(num) == 3 }
    return nil if three_kind.empty?
    (numbers - three_kind).uniq.select { |num| numbers.count(num) == 2 }.size == 1
  end

end

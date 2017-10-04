class Card
  FACE_CARDS = { "T": 10, "J": 11, "Q": 12, "K": 13, "A": 14 }

  attr_reader :number, :suite, :face

  def initialize(card)
    number, suite = card.chars
    @number = FACE_CARDS.fetch(number.to_sym, card).to_i
    @face = number
    @suite = suite
  end

  def same_suite?(card)
    self.suite == card.suite
  end

end

class Hand

  def initialize(cards: [])
    @cards = cards
  end

  def three_of_kind
    numbers.uniq.select { |num| numbers.count(num) == 3 }
  end

  def three_of_kind?
    three_of_kind.size == 1
  end

  def two_pair
    numbers.uniq.select { |num| numbers.count(num) == 2 }
  end

  def two_pair?
    two_pair.size == 2
  end

  def pair
    numbers.uniq.select { |num| numbers.count(num) == 2 }
  end

  def pair?
    pair.size == 1
  end

  private

  def numbers
    numbers = @cards.map { |card| card.number }
  end
end

class RankHandler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def process_hand(hand)
    return accept_hand(hand) if accept_hand(hand)
    return @successor.process_hand(hand) if @successor
    fail_hand(hand)
  end

  def fail_hand(hand)
    puts "The question '#{hand}' could not be answered."
  end

  def accept_hand(hand)
    raise '#accept_request method must be implemented.'
  end
end

class ThreeOfKindHandler < RankHandler
  def accept_hand(hand)
    return ranking(hand) if hand.three_of_kind?
    false
  end

  private

  def ranking(hand)
    { rank: 1, value: hand.three_of_kind }
  end
end

class TwoPairHandler < RankHandler
  def accept_hand(hand)
    return ranking(hand) if hand.two_pair?
    false
  end

  private

  def ranking(hand)
    { rank: 2, value: hand.two_pair }
  end
end

class PairHandler < RankHandler
  def accept_hand(hand)
    return ranking(hand) if hand.pair?
    false
  end

  private

  def ranking(hand)
    { rank: 3, value: hand.pair }
  end
end

chain_of_responsibility = ThreeOfKindHandler.new(
  TwoPairHandler.new(
    PairHandler.new
  )
)

cards = ["TH","8D","5S","9C","9H"].map { |c| Card.new(c) }
rank = chain_of_responsibility.process_hand(
  Hand.new(cards: cards)
)
puts rank

cards = ["TH","8D","9S","9C","9H"].map { |c| Card.new(c) }

rank = chain_of_responsibility.process_hand(
  Hand.new(cards: cards)
)
puts rank

cards = ["TH","8D","8S","9C","9H"].map { |c| Card.new(c) }
rank = chain_of_responsibility.process_hand(
  Hand.new(cards: cards)
)
puts rank

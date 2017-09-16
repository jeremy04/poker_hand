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

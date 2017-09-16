require './lib/card'

class Player
  attr_reader :id, :cards

  def initialize(id:, cards:)
    @id = id
    @cards = cards.map { |card| Card.new(card) }
  end
end

require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @count = cards.count
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    cards.select { |deck| deck.category == category }
  end
end

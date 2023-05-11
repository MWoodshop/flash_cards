# A Round will be the object that processes responses and records guesses.
# A Round is initialized with a Deck.
# The idea is that when we start a Round, the current card is the first in the deck (the first in the Deck’s array of Cards).
# When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.
#
# The take_turn method is the crux of this problem.
# The take_turn method takes a string representing the guess.
# It should create a new Turn object with the appropriate guess and Card.
# It should store this new Turn, as well as return it from the take_turn method.
# Also, when the take_turn method is called, the Round should move on to the next card in the deck.
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards.first
    @turns = []
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    current_card_index = @deck.cards.index(@current_card)
    @current_card = @deck.cards[current_card_index + 1]
    turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct
    (number_correct.to_f / @turns.length) * 100
  end

  def percent_correct_by_category(category)
    total_in_category = @deck.cards_in_category(category).count
    number_correct_in_category = number_correct_by_category(category)
    (number_correct_in_category.to_f / total_in_category) * 100
  end
end

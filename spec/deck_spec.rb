require './lib/deck'

RSpec.describe Deck do
  it 'test 1: creates a new card with correct attirbutes' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    expect(card_1).to have_attributes(answer: 'Juneau', question: 'What is the capital of Alaska?',
                                      category: :Geography)
  end

  it 'test 2: creates a deck with one card and returns an array with one card with correct attribuates' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    deck = Deck.new([card_1])

    expect(deck.cards).to eq([card_1])
  end

  it 'test 3: adds a second card to the deck with correct attirbutes' do
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )

    expect(card_2).to have_attributes(answer: 'Mars',
                                      question: 'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', category: :STEM)
  end

  it 'test 4: creates a deck with the first and second cards and returns an array with the attirbutes of both decks' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('What is the largest planet in our solar system?', 'Jupiter', :Science)
    deck = Deck.new([card_1, card_2])

    expect(deck.cards).to eq([card_1, card_2])
  end

  it 'test 5: knows the number of cards in the deck and returns 3' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('What is the largest planet in our solar system?', 'Jupiter', :Science)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.count).to eq(3)
  end

  it 'test 6: returns the correct cards that have the category :STEM which is [card_3]' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('What is the largest planet in our solar system?', 'Jupiter', :Science)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.cards_in_category(:STEM)).to eq([card_3])
  end
end

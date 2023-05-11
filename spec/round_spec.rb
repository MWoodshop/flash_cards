require 'rspec'
require './lib/deck'
require './lib/round'
require './lib/card'

# 1. be_an_instance_of - when we want to test that an object can be created.
# 2. eq - when we want to test a value of a method.

# In Every Test:
# 1. Test that the object can exist (be_an_instance_of).
# 2. Test any methods/attributes that exist in that class (eq).

# Student object
# Instance of Student Class

describe Round do
  it 'Round exists' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_an_instance_of(Round)
  end

  it 'turns exists and is an empty array' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'round will display the current card' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end

  it 'take_turn exists' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(new_turn).to be_an_instance_of(Turn)
  end

  it 'take turn is a part of the class Turn' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(new_turn).to be_an_instance_of(Turn)
  end

  it 'is new_turn correct?' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(new_turn.correct?).to eq(true)
  end

  it 'how many are correct?' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    expect(round.number_correct).to eq(1)
  end

  it 'take a turn and return number of turns' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    round.current_card
    round.take_turn('Venus')
    expect(round.turns.count).to eq(2)
  end

  it 'return whether the last turn was correct and return feedback' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    round.take_turn('Venus')

    expect(round.turns.last.feedback).to eq('Incorrect.')
  end

  it 'return number correct by category' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  it 'return percent correct' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    expect(round.percent_correct).to eq(50.0)
  end

  it 'return percent correct by category :Geography' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    expect(round.percent_correct_by_category(:Geography)).to eq(100)
  end
end

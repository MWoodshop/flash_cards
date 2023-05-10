require './lib/turn'

RSpec.describe Turn do
  it 'turn has a guess and card exists' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.guess).to eq('Juneau')
    expect(turn.card).to eq(card)
  end

  it 'turn guess is correct' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.correct?).to be(true)
    expect(turn.feedback).to eq('Correct!')
  end

  it 'turn guess is incorrect' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Montreal', card)

    expect(turn.correct?).to be(false)
    expect(turn.feedback).to eq('Incorrect.')
  end
end

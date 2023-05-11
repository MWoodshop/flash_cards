require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new('What is 5 + 5?', '10', :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", 'moose', :Turing)
card_3 = Card.new("What is Mike's middle name?", 'nobody knows', :Turing)
card_4 = Card.new('What cardboard cutout lives at Turing?', 'justin bieber', :Pop_Culture)

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts '-------------------------------------------------'

deck.cards.each_with_index do |card, index|
  puts "This is card number #{index + 1} out of #{deck.count}."
  puts "Question: #{card.question}"
  guess = gets.chomp.downcase
  turn = round.take_turn(guess)
  puts turn.feedback
end

puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
categories = deck.cards.map { |card| card.category }.uniq
categories.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
end

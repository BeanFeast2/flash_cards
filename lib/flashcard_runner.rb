require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

lines = File.readlines('cards.txt')
cards = CardGenerator.new(lines).cards
deck = Deck.new(cards)
round = Round.new(deck)
categories= CardGenerator.new(lines).category_arr
categories.uniq!


p "Welcome! You're playing with #{cards.length} cards."
p '-' * 40
until round.turn_index == cards.length
  p "This is card #{round.turn_index + 1} out of #{cards.length}"
  p "Question: #{round.current_card.question}"
  input = gets.chomp.downcase
  round.take_turn(input)
  p round.turns[round.turn_index - 1].feedback
  p '-' * 40 if round.turn_index != cards.length
end

p '*' * 20 + "Game Over!" + '*' * 20
p "You had #{round.number_correct} correct guesses out of #{cards.length} for a total score of #{round.percent_correct.round(2)}%"
categories.each do |category|
  p "#{category} - #{round.percent_correct_by_category(category.delete(' ').to_sym)}%"
end

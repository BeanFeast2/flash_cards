require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/loader'
require 'pry'

p "What kind of input would you like to use?"
p "Type One of the following"
p "1) API"
p "2) YML"
p "3) TXT"

input = gets.chomp.downcase
#Keeps getting input until it is valid
until input == 'txt' || input == 'yml' || input == 'api'
  p "Type One of the following"
  p "1) API"
  p "2) YML"
  p "3) TXT"
  input = gets.chomp.downcase
end

reader = Loader.new(input).reader
cards = reader.cards
deck = Deck.new(cards)
$round = Round.new(deck)
$categories = reader.category_arr.uniq


def start
  #welcome message
  p "Welcome! You're playing with #{$round.deck.cards.length} cards."
  p '*' * 64
  #game loop until all cards are iterated through
  until $round.turn_index == $round.deck.cards.length
    p "This is card #{$round.turn_index + 1} out of #{$round.deck.cards.length}"
    p "Question: #{$round.current_card.question}"
    #allows input to match answer despite case
    input = gets.chomp.downcase
    $round.take_turn(input)
    p $round.turns[$round.turn_index - 1].feedback
    p '*' * 64 if $round.turn_index != $round.deck.cards.length
  end
  #end of game message with stats
  p '*' * 27 + "Game Over!" + '*' * 27
  p "You had #{$round.number_correct} correct guesses out of #{$round.deck.cards.length} for a total score of #{$round.percent_correct.round(2)}%"
  #prints each category and percentage of correct answers per category
  $categories.each do |category|
    p "#{category} - #{$round.percent_correct_by_category(category.delete(' ').to_sym)}%"
  end
end

start

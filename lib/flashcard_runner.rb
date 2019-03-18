require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/loader'
require './lib/game'
require 'pry'

p "What kind of input would you like to use?"

input = ''
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
round = Round.new(deck)
categories = reader.category_arr.uniq


game = Game.new
game.start(categories, round)

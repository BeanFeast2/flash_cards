require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/loader'
require './lib/game'
require 'pry'

game = Game.new
input = game.input
reader = Loader.new(input).reader
cards = reader.cards
deck = Deck.new(cards)
round = Round.new(deck)
categories = reader.category_arr.uniq
game.start(categories, round)

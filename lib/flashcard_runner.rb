require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

lines = File.readlines('cards.txt')
generator = CardGenerator.new(lines)
cards = generator.cards
categories= generator.category_arr
categories.uniq!
deck = Deck.new(cards)
round = Round.new(deck)

round.start(categories)

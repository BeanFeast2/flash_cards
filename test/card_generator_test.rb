require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test
  def test_it_works
    lines = File.readlines('cards.txt')
    cards = CardGenerator.new(lines)
    assert_instance_of CardGenerator, cards
  end
end

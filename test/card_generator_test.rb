require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    generator = CardGenerator.new('cards.txt')

    assert_instance_of CardGenerator, generator
  end

  def test_it_has_questions
    generator = CardGenerator.new('cards.txt')

    assert_equal "What is 5 + 5?", generator.cards[0].question
    assert_equal "What is Rachel's favorite animal?", generator.cards[1].question
  end

  def test_it_has_answers
    generator = CardGenerator.new('cards.txt')

    assert_equal "10", generator.cards[0].answer
    assert_equal "red panda", generator.cards[1].answer
  end

  def test_it_has_categories
    generator = CardGenerator.new('cards.txt')

    assert_equal :STEM, generator.cards[0].category
    assert_equal :TuringStaff, generator.cards[1].category
  end
end

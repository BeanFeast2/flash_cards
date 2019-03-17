require 'minitest/autorun'
require 'minitest/pride'
require './lib/TXT_reader'
require 'pry'

class TxtReaderTest < Minitest::Test
  def test_it_exists
    generator = TxtReader.new('cards.txt')

    assert_instance_of TxtReader, generator
  end

  def test_it_has_questions
    generator = TxtReader.new('cards.txt')

    assert_equal "What is 5 + 5?", generator.cards[0].question
    assert_equal "What is Rachel's favorite animal?", generator.cards[1].question
  end

  def test_it_has_answers
    generator = TxtReader.new('cards.txt')

    assert_equal "10", generator.cards[0].answer
    assert_equal "red panda", generator.cards[1].answer
  end

  def test_it_has_categories
    generator = TxtReader.new('cards.txt')

    assert_equal :STEM, generator.cards[0].category
    assert_equal :TuringStaff, generator.cards[1].category
  end
end

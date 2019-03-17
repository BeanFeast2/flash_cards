require 'minitest/autorun'
require 'minitest/pride'
require './lib/YML_reader'
require 'pry'

class YmlReaderTest < Minitest::Test
  def test_it_exists
    reader = YmlReader.new('cards.yml')

    assert_instance_of YmlReader, reader
  end

  def test_it_has_questions
    reader = YmlReader.new('cards.yml')
    assert_equal "What is 5 + 5?", reader.cards[0].question
    assert_equal "What is Rachel's favorite animal?", reader.cards[1].question
  end

  def test_it_has_answers
    reader = YmlReader.new('cards.yml')

    assert_equal "10", reader.cards[0].answer
    assert_equal "red panda", reader.cards[1].answer
  end

  def test_it_has_categories
    reader = YmlReader.new('cards.yml')

    assert_equal :STEM, reader.cards[0].category
    assert_equal :TuringStaff, reader.cards[1].category
  end
end

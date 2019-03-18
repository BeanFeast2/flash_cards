require 'minitest/autorun'
require 'minitest/pride'
require './lib/API_reader'
require 'pry'

class ApiReaderTest < Minitest::Test
  attr_accessor :reader

  def setup
    @reader = ApiReader.new('https://opentdb.com/api.php?amount=10&difficulty=easy&type=multiple')
  end

  def test_it_exists

    assert_instance_of ApiReader, reader
  end

  def test_it_has_correct_amount_of_cards_and_categories

    assert_equal 10, reader.cards.length
    assert_equal 10, reader.category_arr.length
  end

  def test_it_creates_cards_correctly

    refute reader.cards[0].answer.nil?
    refute reader.cards[0].question.nil?
    refute reader.cards[0].category.nil?
  end

  def test_it_creates_cards_with_correct_category
    #only General Knowledge categories
    reader2 = ApiReader.new('https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple')
    #only Entertainment categories
    reader3 = ApiReader.new('https://opentdb.com/api.php?amount=10&category=10')

    assert_equal :GeneralKnowledge, reader2.cards[0].category
    assert_equal :Entertainment, reader3.cards[0].category
  end
end

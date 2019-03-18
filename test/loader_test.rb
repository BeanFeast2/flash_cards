require 'minitest/autorun'
require 'minitest/pride'
require './lib/loader'


class LoaderTest < Minitest::Test
  attr_accessor :api_reader, :yml_reader, :txt_reader

  def setup
    @api_reader = Loader.new('api').reader
    @yml_reader = Loader.new('yml').reader
    @txt_reader = Loader.new('txt').reader
  end

  def test_it_exists
    assert_instance_of ApiReader, @api_reader
    assert_instance_of YmlReader, @yml_reader
    assert_instance_of TxtReader, @txt_reader
  end

  def test_it_loads_txt_files
    assert_equal "What is 5 + 5?", @txt_reader.cards[0].question
    assert_equal "What is Rachel's favorite animal?", @txt_reader.cards[1].question
    assert_equal "10", @txt_reader.cards[0].answer
    assert_equal "red panda", @txt_reader.cards[1].answer
    assert_equal :STEM, @txt_reader.cards[0].category
    assert_equal :TuringStaff, @txt_reader.cards[1].category
  end

  def test_it_loads_yml_files
    assert_equal "What is 5 + 5?", @yml_reader.cards[0].question
    assert_equal "What is Rachel's favorite animal?", @yml_reader.cards[1].question
    assert_equal "10", @yml_reader.cards[0].answer
    assert_equal "red panda", @yml_reader.cards[1].answer
    assert_equal :STEM, @yml_reader.cards[0].category
    assert_equal :TuringStaff, @yml_reader.cards[1].category
  end

  def test_it_loads_api
    assert_equal 10, @api_reader.cards.length
    assert_equal 10, @api_reader.category_arr.length
    refute @api_reader.cards[0].answer.nil?
    refute @api_reader.cards[0].question.nil?
    refute @api_reader.cards[0].category.nil?
  end
end

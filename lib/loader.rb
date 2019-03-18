require './lib/TXT_reader'
require './lib/YML_reader'
require './lib/API_reader'
require 'pry'

class Loader
  attr_accessor :reader
  def initialize(file_type)
    case file_type
    when 'txt'
      @reader = TxtReader.new('cards.txt')
    when 'yml'
      @reader = YmlReader.new('cards.yml')
    when 'api'
      @reader = ApiReader.new('https://opentdb.com/api.php?amount=10&difficulty=easy&type=multiple')
    end
  end
end

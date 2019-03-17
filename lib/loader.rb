require './lib/TXT_reader'
require './lib/YML_reader'
require 'pry'

class Loader
  attr_accessor :reader
  def initialize(file_name)
    case file_name[-4..-1]
    when '.txt'
      @reader = TxtReader.new(file_name)
    when '.yml'
      @reader = YmlReader.new(file_name)
    end
  end
end

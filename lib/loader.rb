require './lib/TXT_generator'
require 'pry'

class Loader
  attr_accessor :generator
  def initialize(file_name)
    case file_name[-4..-1]
    when '.txt'
      @generator = TXTGenerator.new(file_name)
    end
  end
end

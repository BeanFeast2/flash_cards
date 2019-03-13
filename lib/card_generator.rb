require './lib/card'

class CardGenerator
  attr_accessor :cards, :category_arr
  def initialize(file_name)
    @cards = []
    @category_arr = []
    generate_cards(file_name)
  end

  def generate_cards(file_name)
    lines = File.readlines(file_name)
    lines.each do |line|
      columns = line.split(',')
      question = columns[0]
      answer = columns[1].downcase
      category = columns[2].delete(' ')[0..-2].to_sym
      category_string = columns[2][0..-2]
      @category_arr << category_string
      @cards << Card.new(question, answer, category)
    end
  end
end

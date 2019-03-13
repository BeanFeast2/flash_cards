require './lib/card'

class CardGenerator
  attr_accessor :cards, :category_arr
  def initialize(lines)
    @cards = []
    @category_arr = []
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

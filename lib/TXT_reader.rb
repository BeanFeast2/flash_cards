require './lib/card'
class TxtReader
  attr_accessor :cards, :category_arr
  def initialize(file)
    @cards = []
    @category_arr = []
    generate_cards(file)
  end

  def generate_cards(file)
    lines = File.readlines(file)
    lines.each do |line|
      next if line.split(',').length != 3
      columns = line.split(',')
      question = columns[0]
      #allows answer to match despite case
      answer = columns[1].downcase
      category = columns[2].delete(' ')[0..-2].to_sym
      category_string = columns[2][0..-2]
      @category_arr << category_string
      @cards << Card.new(question, answer, category)
    end
  end
end

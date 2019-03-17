require './lib/card'
require 'yaml'

class YmlReader
  attr_accessor :cards, :category_arr
  def initialize(file)
    @cards = []
    @category_arr = []
    generate_cards(file)
  end

  def generate_cards(file)
    file = YAML.load_file(file)
    file.values.flatten.each do |card|
      next if card.length != 3
      question = card['question']
      answer = card['answer'].to_s.downcase
      category = card['category'].delete(' ').to_sym
      category_string = card['category']
      @category_arr << category_string
      @cards << Card.new(question, answer, category)
    end
  end
end

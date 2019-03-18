require './lib/card'
require 'HTMLentities'
require 'HTTParty'
require 'uri'
require 'CGI'
require 'pry'

class ApiReader
  attr_accessor :cards, :category_arr, :answers
  def initialize(file)
    @cards = []
    @category_arr = []
    generate_cards(file)
  end

  def generate_cards(file)
    file = HTTParty.get(file)
    binding.pry
    file.parsed_response.values[1].each do |card|
      #Removes odd characters from question string and saves to question
      question = CGI::unescapeHTML(card['question'])
      answer = CGI::unescapeHTML(card['correct_answer']).downcase
      #breaks down long Entertainment and Science categories to just :Entertainment and :Science
      if card['category'].include?('Entertainment')
        category = :Entertainment
        category_string = category.to_s
      elsif card['category'].include?('Science')
        category = :Science
        category_string = category.to_s
      else
        category_string = card['category']
        category = card['category'].delete(' ').to_sym
      end
      @category_arr << category_string
      @cards << Card.new(question, answer, category)
    end
  end
end

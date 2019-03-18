require './lib/API_reader'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'HTMLentities'

file = HTTParty.get('https://opentdb.com/api.php?amount=10&difficulty=easy&type=multiple')
#trying to set up multiple choice questions for user
file.parsed_response.values[1].each do |card|
  # card['incorrect_answers'].map!{|answer| answer.gsub('&quot;', "'").gsub('&#039;', "'").gsub('&eacute;', '').gsub('&amp;', '-').gsub('uml', '').delete('&') }
  # p card['question'].gsub('&quot;', "'").gsub('&#039;', "'").gsub('&eacute;', '').gsub('&amp;', '-').gsub('uml', '').delete('&')
  # answer_arr = card['incorrect_answers']  << card['correct_answer']
  # p answer_arr.shuffle
  str = HTMLEntities.new.decode()
  p str
end

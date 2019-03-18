class Game
  attr_reader :input
  def initialize
    @input = ''
    get_filetype
  end
  
  def start(categories, round)
    print_welcome(round)
    game_loop(round)
    print_end_message(round)
    print_stats(round, categories)
  end

  def get_filetype
    p "What kind of input would you like to use?"
    until @input == 'txt' || @input == 'yml' || @input == 'api'
      p "Type One of the following"
      p "1) API"
      p "2) YML"
      p "3) TXT"
      @input = gets.chomp.downcase
    end
  end

  def print_welcome(round)
    p "Welcome! You're playing with #{round.deck.cards.length} cards."
    p '*' * 64
  end

  def game_loop(round)
    until round.turn_index == round.deck.cards.length
      p "This is card #{round.turn_index + 1} out of #{round.deck.cards.length}"
      p "Question: #{round.current_card.question}"
      #allows input to match answer despite case
      input = gets.chomp.downcase
      round.take_turn(input)
      p round.turns[round.turn_index - 1].feedback
      p '*' * 64 if round.turn_index != round.deck.cards.length
    end
  end

  def print_end_message(round)
    p '*' * 27 + "Game Over!" + '*' * 27
    p "You had #{round.number_correct} correct guesses out of #{round.deck.cards.length} for a total score of #{round.percent_correct.round(2)}%"
  end

  def print_stats(round, categories)
    categories.each do |category|
      p "#{category} - #{round.percent_correct_by_category(category.delete(' ').to_sym)}%"
    end
  end
end

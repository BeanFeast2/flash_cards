
class Round
  attr_accessor :deck, :turns, :turn_index
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_index = 0
  end
  #start game
  def start(categories)
    #welcome message
    p "Welcome! You're playing with #{self.deck.cards.length} cards."
    p '-' * 40
    #game loop until all cards are iterated through
    until self.turn_index == self.deck.cards.length
      p "This is card #{self.turn_index + 1} out of #{self.deck.cards.length}"
      p "Question: #{self.current_card.question}"
      input = gets.chomp.downcase
      self.take_turn(input)
      p self.turns[self.turn_index - 1].feedback
      p '-' * 40 if self.turn_index != self.deck.cards.length
    end
    #end of game message with stats
    p '*' * 20 + "Game Over!" + '*' * 20
    p "You had #{self.number_correct} correct guesses out of #{self.deck.cards.length} for a total score of #{self.percent_correct.round(2)}%"
    #prints each category and percentage of correct answers per category
    categories.each do |category|
      p "#{category} - #{self.percent_correct_by_category(category.delete(' ').to_sym)}%"
    end
  end

  def current_card
    @deck.cards[@turn_index]
  end

  def take_turn(answer)
    turn = Turn.new(answer, @deck.cards[@turn_index])
    @turn_index += 1
    @turns << turn
    turn
  end

  def number_correct
    @turns.count{|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    correct = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        correct += 1
      end
    end
    correct
  end

  def percent_correct
    (self.number_correct / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    (self.number_correct_by_category(category) / self.deck.cards_in_category(category).length.to_f) * 100
  end
end

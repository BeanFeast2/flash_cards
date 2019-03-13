class Round
  attr_accessor :deck, :turns, :turn_index
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_index = 0
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

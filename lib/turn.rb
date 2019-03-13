class Turn
  attr_accessor :card, :guess, :correct
  def initialize(g, c)
    @guess = g
    @card = c
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    @guess == @card.answer ? 'Correct!' : 'Incorrect!'
  end
end

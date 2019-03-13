class Deck
  attr_accessor :cards
  def initialize(card_arr)
    @cards = card_arr
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    @cards.select{|c| c.category == category}
  end
end

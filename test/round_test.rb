require 'minitest/autorun'
require 'minitest/test'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_instance_of Round, round
    assert_instance_of Deck, round.deck
  end

  def test_it_has_no_turns_at_first
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert round.turns.empty?
  end

  def test_it_can_take_a_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal card_1, round.current_card

    new_turn = round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
    assert new_turn.correct?
    assert_equal [new_turn], round.turns
    assert_equal 1, round.number_correct
    assert_equal card_2, round.current_card

    round.take_turn("Venus")
    assert_equal 2, round.turns.count
    assert_equal 'Incorrect!', round.turns.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)
    assert_equal 50.0, round.percent_correct
    assert_equal 100.0, round.percent_correct_by_category(:Geography)
    assert_equal card_3, round.current_card
  end
end

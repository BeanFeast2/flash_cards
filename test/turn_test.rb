require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    assert_instance_of Card, turn.card
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal 'Juneau', turn.guess
  end

  def test_it_returns_answer_result
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    assert turn.correct?
  end

  def test_it_returns_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal 'Correct!', turn.feedback
  end

  def test_it_returns_answer_result_thats_false
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Achorage', card)

    refute turn.correct?
  end

  def test_it_returns_feedback_when_answer_is_wrong
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Anchorage', card)

    assert_equal 'Incorrect!', turn.feedback
  end

end

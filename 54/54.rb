# Poker hands
# Problem 54

# In the card game poker, a hand consists of five cards and are ranked, from
# lowest to highest, in the following way:

  # High Card: Highest value card.
  # One Pair: Two cards of the same value.
  # Two Pairs: Two different pairs.
  # Three of a Kind: Three cards of the same value.
  # Straight: All cards are consecutive values.
  # Flush: All cards of the same suit.
  # Full House: Three of a kind and a pair.
  # Four of a Kind: Four cards of the same value.
  # Straight Flush: All cards are consecutive values of same suit.
  # Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

# If two players have the same ranked hands then the rank made up of the
# highest value wins; for example, a pair of eights beats a pair of fives
# (see example 1 below). But if two ranks tie, for example, both players have
# a pair of queens, then highest cards in each hand are compared (see example
# 4 below); if the highest cards tie then the next highest cards are compared,
# and so on.

# Consider the following five hands dealt to two players:

#    Player 1	 	  Player 2	 	  Winner
# 5H 5C 6S 7S KD  2C 3S 8S 8D TD  Player 2
# Pair of Fives   Pair of Eights

# The file, poker.txt, contains one-thousand random hands dealt to two players.
# Each line of the file contains ten cards (separated by a single space): the
# first five are Player 1's cards and the last five are Player 2's cards.
# You can assume that all hands are valid (no invalid characters or repeated
# cards), each player's hand is in no specific order, and in each hand there
# is a clear winner.

# How many hands does Player 1 win?

def test_hand
  Hand.new [
    Card.new '5H',
    Card.new '5C',
    Card.new '6S',
    Card.new '72',
    Card.new 'KD'
  ]
end

class Card
  include Comparable
  attr_reader :value, :suit

  def initialize value_suit_string
    @value = value_suit_string.chars.first
    @suit = value_suit_string.chars.last
  end

  def <=>(other_card)
    point_value <=> other_card.point_value
  end

  def point_value
    upper_values = %w[T J Q K A]
    if upper_values.include?(value)
      10 + upper_values.index(value)
    else
      value
    end
  end
end

class Hand
  include Enumerable
  attr_reader :cards

  def initialize(cards=[])
    @cards = cards
  end

  def each(&block)
    @cards.each(&block)
  end

  def highest_play
    # TODO
  end

  # private
    def n_of_kind?(n)
      each do |card|
        return card.value if cards.count { |c| c.value == card.value } == n
      end
      false
    end

    def straight?
      values = cards.map(&:point_value).sort
      values == (values.first..(values.first + values.length - 1)).to_a
    end

    def flush?
      suit = cards.first.suit
      cards.all? { |c| c.suit == suit }
    end
end

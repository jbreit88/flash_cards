require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@deck).to be_instance_of(Deck)
    end
  end

  describe '#cards' do
    it 'creates array of cards' do
      expect(@deck.cards).to eq(@cards)
    end
  end

  describe '#count' do
    it 'counts length of cards array' do
      expect(@deck.count).to eq(@cards.length)
    end
  end

  describe '#cards_in_category' do
    it 'returns cards with given category' do
      expect(@deck.cards_in_category(:STEM)).to eq([@card_2, @card_3])
    end

    it 'returns nothing if search criteria matches nothing' do
      expect(@deck.cards_in_category('Pop Culture')).to eq []
    end
  end

  describe '#get_all_categories' do
    it 'returns categories in array' do
      expect(@deck.get_all_categories).to be_instance_of Array

      expect(@deck.get_all_categories).to eq [:Geography, :STEM]
    end

    it 'returns categories in larger array' do
      card_4 = Card.new("Who is the wizarding protagonist in the 7 part series written by J.K. Rowling?", "Harry Potter", :Pop_Culture)

      @cards << card_4

      @deck = Deck.new(@cards)

      expect(@deck.get_all_categories).to eq [:Geography, :STEM, :Pop_Culture]
    end
  end
end

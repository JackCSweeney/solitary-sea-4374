require 'rails_helper'

RSpec.describe CharacterSearchFacade do
  before(:each) do
    @facade = CharacterSearchFacade.new("fire+nation")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facade).to be_a(CharacterSearchFacade)
    end
  end

  describe '#instance methods' do
    describe '#characters' do
      it 'can return nation characters based on the search parameters it was initialized with' do
        expect(@facade.characters).to be_a(Array)
        expect(@facade.characters.first).to be_a(Character)
      end
    end

    describe '#character_count' do
      it 'can return the correct number of characters it created for given search terms' do
        expect(@facade.character_count).to eq(97)
      end
    end

    describe '#first_25_characters' do
      it 'returns only the first 25 characters' do
        expect(@facade.first_25_characters.count).to eq(25)
      end
    end
  end
end
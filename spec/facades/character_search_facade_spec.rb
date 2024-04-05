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
  end
end
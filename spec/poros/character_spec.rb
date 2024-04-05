require 'rails_helper'

RSpec.describe Character do
  before(:each) do
    character_data = {
      allies: [
        "Me",
        "Them"
      ],
      enemies: [
        "You"
      ],
      photoUrl: "Someurl.com",
      name: "Gus",
      affiliation: "The cool guys"
    }

    @character = Character.new(character_data)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@character).to be_a(Character)
    end
  end

  describe '#attributes' do
    it 'has attributes' do
      expect(@character.allies).to eq(["Me", "Them"])
      expect(@character.enemies).to eq(["You"])
      expect(@character.photoUrl).to eq("Someurl.com")
      expect(@character.name).to eq("Gus")
      expect(@character.affiliation).to eq("The cool guys")
    end
  end
end

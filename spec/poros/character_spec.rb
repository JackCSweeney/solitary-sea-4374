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

    character_data_2 = {
      allies: [],
      enemies: [],
      photoUrl: "Someurl.com",
      name: "Gus",
      affiliation: "The cool guys"
    }

    @character = Character.new(character_data)
    @character_2 = Character.new(character_data_2)
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

  describe '#no_allies?' do
    it 'returns true or false based on allies being present' do
      expect(@character.no_allies?).to eq(false)
      expect(@character_2.no_allies?).to eq(true)
    end
  end

  describe '#no_enemies?' do
    it 'returns true or false based on enemies being present' do
      expect(@character.no_enemies?).to eq(false)
      expect(@character_2.no_enemies?).to eq(true)
    end
  end
end

require 'rails_helper'

RSpec.describe CharacterSearchService do
  before(:each) do
    @service = CharacterSearchService.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@service).to be_a(CharacterSearchService)
    end
  end

  describe '#class methods' do
    describe '#get_characters(search_params)' do
      it 'can return data with character info for the given search params' do
        expect(CharacterSearchService.get_characters("fire+nation")).to be_a(Array)
        expect(CharacterSearchService.get_characters("fire+nation").first).to be_a(Hash)

        data = CharacterSearchService.get_characters("fire+nation").first

        expect(data).to have_key(:allies)
        expect(data[:allies]).to be_a(Array)
        expect(data[:allies].first).to be_a(String)

        expect(data).to have_key(:enemies)
        expect(data[:enemies]).to be_a(Array)
        expect(data[:enemies].first).to be_a(String)

        expect(data).to have_key(:photoUrl)
        expect(data[:photoUrl]).to be_a(String)

        expect(data).to have_key(:name)
        expect(data[:name]).to be_a(String)

        expect(data).to have_key(:affiliation)
        expect(data[:affiliation]).to be_a(String)
      end
    end

    describe '#self.conn' do
      it 'creates a faraday connection' do
        expect(CharacterSearchService.conn).to be_a(Faraday::Connection)
      end
    end

    describe '#self.get_url(url)' do
      it 'returns an unparsed Faraday::Response response for the given URL' do
        expect(CharacterSearchService.get_url("/api/v1/characters?affiliation=fire+nation&perPage=200")).to be_a(Faraday::Response)
      end
    end
  end
end


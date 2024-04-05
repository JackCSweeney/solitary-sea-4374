class CharacterSearchFacade

  def initialize(search_params)
    @search_params = search_params
  end

  def characters
    CharacterSearchService.get_characters(@search_params).map do |character_info|
      Character.new(character_info)
    end
  end

  def character_count
    characters.count
  end

  def first_25_characters
    characters.slice(0, 25)
  end

end
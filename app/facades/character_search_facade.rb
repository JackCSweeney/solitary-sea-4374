class CharacterSearchFacade

  def initialize(search_params)
    @search_params = search_params
  end

  def characters
    CharacterSearchService.get_characters(@search_params).map do |character_info|
      Character.new(character_info)
    end
  end

end
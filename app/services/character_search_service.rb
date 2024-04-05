class CharacterSearchService

  def self.get_characters(search_params)
    response = get_url("/api/v1/characters?affiliation=#{search_params}&perPage=200")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: "https://last-airbender-api.fly.dev")
  end

  def self.get_url(url)
    conn.get(url)
  end
end
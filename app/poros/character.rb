class Character
  attr_reader :allies,
              :enemies,
              :photoUrl,
              :name,
              :affiliation

  def initialize(data)
    @allies = data[:allies]
    @enemies = data[:enemies]
    @photoUrl = data[:photoUrl]
    @name = data[:name]
    @affiliation = data[:affiliation]
  end
end
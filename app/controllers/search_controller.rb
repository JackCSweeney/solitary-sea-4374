class SearchController < ApplicationController

  def index
    @facade = CharacterSearchFacade.new(params[:nation])
  end

end
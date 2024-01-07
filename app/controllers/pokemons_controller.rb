class PokemonsController < ApplicationController
  helper_method :current_params

  def index
    @pokemons = Pokemon.where(id: ..1008).preload(:types).with_attached_default_sprite
    if current_params[:name].present?
      @pokemons = @pokemons.joins(:types).where(types: { identifier: downcased_name })
        .or(@pokemons.where("name LIKE ?", "%#{downcased_name}%"))
        .distinct
    end
    @pokemons = set_page_and_extract_portion_from @pokemons.order(:id)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def current_params
    params.permit(:name, :page) || {}
  end

  def downcased_name
    current_params[:name].downcase
  end
end

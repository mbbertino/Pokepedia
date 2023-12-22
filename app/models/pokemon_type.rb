class PokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type

  include Pokemon::Importable

  IMPORTING_MAP = [
    %w[pokemon_id pokemon_id],
    %w[type_id type_id],
    %w[slot slot]
  ].freeze

  IMPORTING_FILE_NAME = 'pokemon_types.csv'.freeze
end

class Type < ApplicationRecord
  has_many :pokemon_types
  has_many :pokemons, through: :pokemon_types

  include Pokemon::Importable

  IMPORTING_MAP = [
    %w[id id],
    %w[identifier identifier],
  ].freeze

  IMPORTING_FILE_NAME = 'types.csv'.freeze
end

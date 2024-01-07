class Stat < ApplicationRecord
  has_many :pokemon_stats
  has_many :pokemons, through: :pokemon_stats

  include Pokemon::Importable

  IMPORTING_MAP = [
    %w[id id],
    %w[identifier identifier],
  ].freeze

  IMPORTING_FILE_NAME = 'stats.csv'.freeze
end

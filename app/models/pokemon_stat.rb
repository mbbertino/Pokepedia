class PokemonStat < ApplicationRecord
  belongs_to :pokemon
  belongs_to :stat

  include Pokemon::Importable

  IMPORTING_MAP = [
    %w[pokemon_id pokemon_id],
    %w[stat_id stat_id],
    %w[base_stat base_stat]
  ].freeze

  IMPORTING_FILE_NAME = 'pokemon_stats.csv'.freeze

  delegate :identifier, to: :stat, prefix: true
end

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

  def abbreviated_stat_identifier
    {
      'hp' => 'HP',
      'attack' => 'ATK',
      'defense' => 'DEF',
      'special-attack' => 'SP. ATK',
      'special-defense' => 'SP. DEF',
      'speed' => 'SPD'
    }[stat_identifier]
  end

  def base_stat_percentage
    ((base_stat.to_f / 255) * 100).round
  end
end

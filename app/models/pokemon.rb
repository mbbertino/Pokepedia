require "open-uri"
require 'csv'

class Pokemon < ApplicationRecord
  include Pokemon::Importable

  IMPORTING_MAP = [
    %w[id id],
    %w[identifier name],
    %w[order order],
    %w[species_id species_id],
  ].freeze

  IMPORTING_FILE_NAME = 'pokemon.csv'.freeze

  # Association for the Pokémon it can evolve into (multiple evolutions)
  has_many :evolutions, class_name: 'Pokemon', foreign_key: 'evolves_from_id'

  # Association for the Pokémon it evolved from
  belongs_to :pre_evolution, class_name: 'Pokemon', foreign_key: 'evolves_from_id', optional: true

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :pokemon_stats
  has_many :stats, through: :pokemon_stats

  has_one_attached :default_sprite
  has_one_attached :front_default_sprite

  class << self
    def import_descriptions
      pokemon_species_flavor_text_file = File.read(Rails.root.join('db', 'pokemon_csvs', 'pokemon_species_flavor_text.csv'))
      pokemon_species_flavor_text = CSV.parse(pokemon_species_flavor_text_file, headers: true)
      pokemon_species_flavor_text.each do |row|
        next unless row['language_id'] == '9'

        if (pokemon = Pokemon.find_by(species_id: row['species_id']))
          pokemon.update(description: row['flavor_text'])
        end
      end
    end

    def set_evolves_from
      pokemon_species = File.read(Rails.root.join('db', 'pokemon_csvs', 'pokemon_species.csv'))
      pokemon_species = CSV.parse(pokemon_species, headers: true)
      pokemon_species.each do |row|
        if (pokemon = Pokemon.find_by(name: row['identifier']))
          next unless row['evolves_from_species_id'].present?
          pokemon.update!(evolves_from_id: Pokemon.order(:id).find_by(species_id: row['evolves_from_species_id']).id)
        end
      end
    end
  end

  def attach_default_sprite_later
    Pokemon::AttachSpriteJob.perform_later(self)
  end

  def attach_default_sprite
    default_sprite.purge if default_sprite.attached?
    sprite_uri = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/#{id}.png"
    default_sprite.attach(io: URI.parse(sprite_uri).open, filename: "#{id}_default_sprite.png" )
  end

  def full_evolution_chain
    base_form = find_base_form
    chain = [[base_form]]
    base_form.build_evolution_chain(chain, 1)
    chain.reject(&:empty?)
  end

  def build_evolution_chain(chain, level)
    chain[level] ||= []
    evolutions.each do |evolution|
      chain[level] << evolution
      evolution.build_evolution_chain(chain, level + 1)
    end
  end

  def find_base_form
    current_pokemon = self
    while current_pokemon.pre_evolution.present?
      current_pokemon = current_pokemon.pre_evolution
    end
    current_pokemon
  end
end

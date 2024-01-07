class Pokemon::AttachSpriteJob < ApplicationJob
  queue_as :default

  def perform(pokemon)
    pokemon.attach_default_sprite
  end
end

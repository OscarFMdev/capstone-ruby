require_relative 'item'
class Game < Item
  def initialize(multiplayer, last_played_at)
    super(game)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end

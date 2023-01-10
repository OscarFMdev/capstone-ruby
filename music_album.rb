require_relative item

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super()
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return true if super || @on_spotify == true

    false
  end
end

music_album = MusicAlbum.new('no')
puts music_album.can_be_archived?

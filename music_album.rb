require_relative item

class MusicAlbum < Item
  def initialize(on_spotify)
    super()
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?(published_date)
    published_date > 10
  end
end

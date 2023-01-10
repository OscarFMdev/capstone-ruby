require_relative item

class Book < Item
  def initialize(publisher, cover_state)
    super(book, music_album, game)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?(published_date)
    published_date > 10
  end
end

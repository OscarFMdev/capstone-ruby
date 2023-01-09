class Item

  def initialize(book, music_album, game)
    @book = book
    @music_album = music_album
    @game = game
  end

  def can_be_archived?(published_date)
    published_date > 10
  end

  def move_to_archive(item)
    if can_be_archived?
      item.archived = false  
    end
  end
  
end
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
    return unless can_be_archived?

    item.archived = false
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end

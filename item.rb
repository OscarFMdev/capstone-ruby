require 'date'

class Item
  def initialize(archive: false, published_date: Date.today)
    @id = Random.rand(1..1000)
    @archive = archive
    @published_date = published_date
  end

  def can_be_archived?
    @published_date > 10
  end

  def move_to_archive
    @archive = can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end

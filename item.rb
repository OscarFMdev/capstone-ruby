require 'date'

class Item
  attr_accessor :published_date

  def initialize(archive: false, published_date: Date.today)
    @id = Random.rand(1..1000)
    @archive = archive
    @published_date = published_date
  end

  def move_to_archive
    @archive = can_be_archived?
    can_be_archived?
  end

  attr_writer :label

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  private

  attr_accessor :id, :archive

  def can_be_archived?
    @published_date > 10
  end
end

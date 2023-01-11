require 'date'

class Item
  attr_accessor :published_date

  def initialize(archive: false, published_date: Date.new(2022,10,10))
    @id = Random.rand(1..1000)
    @archive = archive
    @published_date = published_date
  end

  def move_to_archive
    @archive = can_be_archived?
    can_be_archived?
  end

  attr_writer :label

  def years_between_dates(date1 = @published_date, date2 =  Date.today)
    (date2.year - date1.year) + ((date2.month - date1.month) + ((date2.day - date1.day) < 0 ? -1 : 0) < 0 ? -1 : 0)
  end

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
    years_between_dates > 10
  end
end
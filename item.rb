require 'date'

class Item
  attr_accessor :published_date

  def initialize(archive: false, published_date: Date.new(2022, 10, 10))
    @id = Random.rand(1..1000)
    @archive = archive
    @published_date = published_date
  end

  def move_to_archive
    @archive = can_be_archived?
    can_be_archived?
  end

  attr_writer :label, :author, :genre

  def years_between_dates(date1 = @published_date, date2 = Date.today)
    date1, date2 = date2, date1 if date1 > date2
    diff_year = date2.year - date1.year
    diff_month = date2.month - date1.month
    diff_day = date2.day - date1.day
    diff_year - (diff_month.negative? || (diff_month.zero? && diff_day.negative?) ? 1 : 0)
  end

  private

  attr_accessor :id, :archive

  def can_be_archived?
    years_between_dates > 10
  end
end

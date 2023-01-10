class Book
  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?(published_date)
    published_date > 10
  end
end

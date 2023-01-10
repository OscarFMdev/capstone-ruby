class Genre
  attr_accessor :name

  def initialize(_id, name, items)
    @id = Random.rand(1..1000)
    @name = name
    @items = items
  end

  private

  attr_accessor :id, :items
end

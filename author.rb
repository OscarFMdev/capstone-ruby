class Author
  attr_accessor :first_name, :last_name

  def initialize(id, first_name, last_name, items)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  private

  attr_accessor :id, :items
end

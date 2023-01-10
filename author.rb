class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  private 
  attr_accessor :id, :items
end


author = Author.new('Hello', 'World')
p author.items
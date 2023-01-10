require_relative 'item'

class Genre < Item
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  private :id, :items

  def add_item(item)
    @item << item
    item.label = self
  end  
end

require_relative './../item'

describe 'Test Item class' do
  item = Item.new(published_date: '25/10/2023')

  it 'takes parameters and returns a item object' do
    expect(item).to be_instance_of(Item)
  end

  it "item published_date should be '25/10/2023'" do
    expect(item.published_date).to eql '25/10/2023'
  end
end

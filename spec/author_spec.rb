require_relative './../author'

describe 'Test Author class' do
  author = Author.new('John', 'Katzenbach')

  it 'takes parameters and returns an author object' do
    expect(author).to be_instance_of(Author)
  end

  it "author first name should be 'John'" do
    expect(author.first_name).to eql 'John'
  end

  it "author last name should be 'John'" do
    expect(author.last_name).to eql 'Katzenbach'
  end
end

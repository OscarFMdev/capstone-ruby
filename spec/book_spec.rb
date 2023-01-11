require_relative './../book'

describe 'Test Book class' do
  book = Book.new('test1', 'bad')

  it 'takes parameters and returns a book object' do
    expect(book).to be_instance_of(Book)
  end

  it 'takes parameters and returns a book object which is instance of Item' do
    expect(book).to be_kind_of(Item)
  end

  it 'books move_to_archive should be true' do
    expect(book.move_to_archive).to eql true
  end

  it "book publisher should be 'test1'" do
    expect(book.publisher).to eql 'test1'
  end
end

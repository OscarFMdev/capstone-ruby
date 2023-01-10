require_relative './../genre'

describe 'Test Genre class' do
  genre = Genre.new('testGenre')

  it 'takes parameters and returns a genre object' do
    expect(genre).to be_instance_of(Genre)
  end

  it "Genre name should be 'testGenre'" do
    expect(genre.name).to eql 'testGenre'
  end
end

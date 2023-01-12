require_relative './../music_album'

describe 'Test MusicAlbum class' do
  music_album = MusicAlbum.new(true)

  it 'takes parameters and returns a MusicAlbum object' do
    expect(music_album).to be_instance_of(MusicAlbum)
  end

  it 'takes parameters and returns a MusicAlbum object which is instance of Item' do
    expect(music_album).to be_kind_of(Item)
  end

  it 'MusicAlbum can_be_archived? should be true' do
    expect(music_album.can_be_archived?).to eql true
  end

  it "MusicAlbum on_spotipy should be 'true'" do
    expect(music_album.on_spotify).to eql true
  end
end

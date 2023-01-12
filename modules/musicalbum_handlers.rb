module MusicAlbumHandlers
  def handle_music_albums
    return if @music_albums.empty?

    data = JSON.pretty_generate(@music_albums.map do |e|
                                  {
                                    on_spotify: e['on_spotify'],
                                    can_be_archived: e['can_be_archived']
                                  }
                                end)

    File.write('./data/music_albums.json', data)
    puts 'Music Albums saved successfully'
  end

  def handle_genres
    return if @genres.empty?

    data = JSON.pretty_generate(@genres.map do |e|
                                  {
                                    name: e['name']
                                  }
                                end)

    File.write('./data/genres.json', data)
    puts 'Genres saved successfully'
  end
end

module MusicAlbumModule
  def add_music_album
    puts ''
    puts 'Is on Spotify (1) or no (2)? [Input the number]:'
    state = gets.chomp.to_i
    puts ''
    case state
    when 1
      music_album = MusicAlbum.new(true)
      create_music_album(music_album)
    when 2
      music_album = MusicAlbum.new(false)
      create_music_album(music_album)
    else
      puts 'Incorrect number, please enter the Music Album again'
      add_music_album
    end
  end

  def create_music_album(music_album)
    input_date(music_album)
    add_label(music_album)
    add_author(music_album)
    add_genre(music_album)
    @music_albums << { 'on_spotify' => music_album.on_spotify,
                       'can_be_archived' => music_album.move_to_archive }
    puts ''
    puts 'Music Album and label/author/genre successfully added'
  end

  def list_music_albums
    puts ''
    puts 'Music Album list'
    puts "These are all saved Music Albums:\ncount(#{@music_albums.count})\n "
    if @music_albums.empty?
      puts 'No Music Albums in the database'
    else
      @music_albums.each_with_index do |m, i|
        puts "#{i + 1}) On Sporify: #{m['on_spotify']},
        can be archived: #{m['can_be_archived']}"
      end
      puts "\nEnd of the Music Album's list\n "
    end
  end
end

module GenreModule
  def add_genre(item)
    puts 'Genre:'
    name = gets.chomp.to_s
    genre = Genre.new(name)
    genre.add_item(item)
    @genres << { 'name' => genre.name }
  end

  def list_genres
    puts ''
    puts 'Genres list'
    puts "These are all saved genres:\ncount(#{@genres.count})\n "
    if @genres.empty?
      puts 'No Genres in the database'
    else
      @genres.each_with_index do |g, i|
        puts "#{i + 1}) Genre's Name: #{g['name']}"
      end
      puts "\nEnd of the genre's list\n "
    end
  end
end

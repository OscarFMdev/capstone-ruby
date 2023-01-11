module ListGames
  def list_games
    puts ''
    puts 'Game list'
    puts "These are all saved games:\ncount(#{@games.count})\n "
    if @games.empty?
      puts 'No games in the database'
    else
      @games.each_with_index do |b, i|
        puts "#{i + 1}) Multiplayer: #{b['multiplayer']}, Last played at: #{b['last_played_at']},
        can be archived: #{b['can_be_archived']}"
      end
      puts "\nEnd of the game's list\n "
    end
  end
end

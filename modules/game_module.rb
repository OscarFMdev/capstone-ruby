module GameModule
  def add_game
    puts ''
    puts 'Is the game multiplayer (1) or not (2)? [Input the number]:'
    multiplayer = gets.chomp.to_i
    case multiplayer
    when 1
      game = Game.new(true)
      puts 'When was the last time you played it?:'
      date = input_date(game)
      game.last_played_at = date
      add_author(game)
      add_label(game)
      add_genre(game)
      @games << { 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at,
                  'can_be_archived' => game.move_to_archive }
      puts ''
      puts 'Game successfully added'
    when 2
      game = Game.new(false)
      puts 'When was the last time you played it?:'
      date = input_date(game)
      game.last_played_at = date
      add_author(game)
      add_author(game)
      add_label(game)
      @games << { 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at,
                  'can_be_archived' => game.move_to_archive }
      puts ''
      puts 'Game successfully added'
    else
      puts 'Incorrect number, please enter the game again'
      add_game
    end
  end

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

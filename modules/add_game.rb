module AddGame
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
    when 2
      game = Game.new(false)
      puts 'When was the last time you played it?:'
      input_date(game)
      add_author(game)
    else
      puts 'Incorrect number, please enter the game again'
      add_game
    end
  end
end

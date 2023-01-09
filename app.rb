ACTIONS = {
  1 => :list_books,
  2 => :list_music_albums,
  3 => :list_games,
  4 => :list_genres,
  5 => :list_labels,
  6 => :list_authors,
  7 => :list_sources,
  8 => :add_book,
  9 => :add_music_album,
  10 => :add_game,
  0 => :break
}.freeze

class App
  def options
    puts ''
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - List all sources'
    puts '8 - Add a book'
    puts '9 - Add a music album'
    puts '10 - Add a game'
    puts '0 - Exit'
  end

  def select
    loop do
      options
      option = gets.chomp.to_i
      action = ACTIONS[option]
      if action == :break
        puts 'Thank you for using this app!'
        break
      elsif action
        send(action)
      else
        puts 'Error: Invalid number, try again'
      end
    end
  end
end

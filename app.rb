require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'author'
require 'json'
require_relative 'read_data'

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

# this is a class
class App
  include ReadData

  def initialize
    @books = read_books
    @labels = read_labels
    @games = read_games
    @authors = read_authors
  end

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
        handle_exit
        puts 'Thank you for using this app!'
        break
      elsif action
        send(action)
      else
        puts 'Error: Invalid number, try again'
      end
    end
  end

  def list_books
    puts ''
    puts 'Book list'
    puts "These are all saved books:\ncount(#{@books.count})\n "
    if @books.empty?
      puts 'No books in the database'
    else
      @books.each_with_index do |b, i|
        puts "#{i + 1}) Publisher: #{b['publisher']}, cover state: #{b['cover_state']},
        can be archived: #{b['can_be_archived']}"
      end
      puts "\nEnd of the book's list\n "
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
      puts "\nEnd of the book's list\n "
    end
  end

  def list_labels
    puts ''
    puts 'Label list'
    puts "These are all saved label:\ncount(#{@labels.count})\n "
    if @labels.empty?
      puts 'No labels in the database'
    else
      @labels.each_with_index do |b, i|
        puts "#{i + 1}) Title: #{b['title']}, color: #{b['color']}"
      end
      puts "\nEnd of the label's list\n "
    end
  end

  def add_book
    puts ''
    puts 'Publisher name:'
    publisher = gets.chomp.to_s
    puts 'Is the cover state good (1) or bad (2)? [Input the number]:'
    state = gets.chomp.to_i
    puts ''
    case state
    when 1
      book = Book.new(publisher, 'good')
      add_label(book)
    when 2
      book = Book.new(publisher, 'bad')
      add_label(book)
    else
      puts 'Incorrect number, please enter the book again'
      add_book
    end
  end

  def add_game
    puts ''
    puts 'Is the game multiplayer (1) or not (2)? [Input the number]:'
    multiplayer = gets.chomp.to_i
    case multiplayer
    when 1
      game = Game.new(true)
      puts 'When was the last time you played it?:'
      date = input_date(game)
      add_author(game)
      game.last_played_at = date
    when 2
      game = Game.new(false, year, month, day)
      puts 'When was the last time you played it?:'
      input_date(game)
      add_author(game)
    else
      puts 'Incorrect number, please enter the game again'
      add_game
    end
  end

  def add_label(item)
    puts 'Label title:'
    title = gets.chomp.to_s
    puts 'Label color:'
    color = gets.chomp.to_s
    label = Label.new(title, color)
    label.add_item(item)
    @labels << { 'title' => label.title, 'color' => label.color }
    @books << { 'publisher' => item.publisher, 'cover_state' => item.cover_state,
                'can_be_archived' => item.move_to_archive }
    puts ''
    puts 'Book and label successfully added'
  end
  def add_author(item)
    puts 'Author fist name:'
    first_name = gets.chomp.to_s
    puts 'Author last name:'
    last_name = gets.chomp.to_s
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @authors << { 'first_name' => author.first_name, 'last_name' => author.last_name }
    @games << { 'multiplayer' => item.multiplayer, 'last_played_at' => item.last_played_at,
                'can_be_archived' => item.move_to_archive }
    puts ''
    puts 'Game and author successfully added'
  end

  def handle_exit
    handle_books
    handle_label
    handle_games
    handle_authors
  end

  def handle_books
    return if @books.empty?

    data = JSON.pretty_generate(@books.map do |e|
                                  {
                                    publisher: e['publisher'],
                                    cover_state: e['cover_state'],
                                    can_be_archived: e['can_be_archived']
                                  }
                                end)

    File.write('./data/books.json', data)
    puts 'books saved successfully'
  end

  def handle_label
    return if @labels.empty?

    data = JSON.pretty_generate(@labels.map do |e|
                                  {
                                    title: e['title'],
                                    color: e['color']
                                  }
                                end)

    File.write('./data/labels.json', data)
    puts 'labels saved successfully'
  end
  def handle_games
    return if @games.empty?

    data = JSON.pretty_generate(@games.map do |e|
                                  {
                                    multiplayer: e['multiplayer'],
                                    last_played_at: e['last_played_at'],
                                    can_be_archived: e['can_be_archived']
                                  }
                                end)

    File.write('./data/games.json', data)
    puts 'Games saved successfully'
  end

  def handle_authors
    return if @authors.empty?

    data = JSON.pretty_generate(@authors.map do |e|
                                  {
                                    first_name: e['first_name'],
                                    last_name: e['last_name']
                                  }
                                end)

    File.write('./data/authors.json', data)
    puts 'Authors saved successfully'
  end

  def input_date(item)
    puts 'Year:'
    year = gets.chomp.to_i
    puts 'Month:'
    month = gets.chomp.to_i
    puts 'Day:'
    day = gets.chomp.to_i
    item.published_date = Date.new(year, month, day)
    return item.published_date
  end
end

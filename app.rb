require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'author'
require_relative 'genre'
require_relative 'music_album'
require_relative 'read_data'
require_relative './modules/book_module'
require_relative './modules/label_module'
require_relative './modules/book_handlers'
require_relative './modules/game_module'
require_relative './modules/author_module'
require_relative './modules/game_handlers'
require_relative './modules/musicalbum_module'
require_relative './modules/genre_module'
require_relative './modules/musicalbum_handlers'

ACTIONS = {
  1 => :list_books,
  2 => :list_music_albums,
  3 => :list_games,
  4 => :list_genres,
  5 => :list_labels,
  6 => :list_authors,
  7 => :add_book,
  8 => :add_music_album,
  9 => :add_game,
  0 => :break
}.freeze

# this is a class
class App
  include ReadData
  include LabelModule
  include BookModule
  include BookHandlers
  include GameModule
  include AuthorModule
  include GameHandlers
  include MusicAlbumModule
  include GenreModule
  include MusicAlbumHandlers

  def initialize
    @books = read_books
    @labels = read_labels
    @games = read_games
    @authors = read_authors
    @music_albums = read_music_albums
    @genres = read_genres
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
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
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

  def handle_exit
    handle_books
    handle_label
    handle_games
    handle_authors
    handle_music_albums
    handle_genres
  end

  def input_date(item)
    puts 'Year:'
    year = gets.chomp.to_i
    puts 'Month:'
    month = gets.chomp.to_i
    puts 'Day:'
    day = gets.chomp.to_i
    item.published_date = Date.new(year, month, day)
    item.published_date
  end
end

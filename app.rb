require_relative 'book'
require_relative 'label'
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

  def handle_exit
    handle_books
    handle_label
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
end

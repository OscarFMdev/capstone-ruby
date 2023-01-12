module BookModule
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
      puts 'When was it created?:'
      input_date(book)
      add_author(book)
      add_label(book)
      add_genre(book)
      @books << { 'publisher' => book.publisher, 'cover_state' => book.cover_state,
                  'can_be_archived' => book.move_to_archive }
      puts ''
      puts 'Book successfully added'
    when 2
      book = Book.new(publisher, 'bad')
      puts 'When was it created?:'
      input_date(book)
      add_author(book)
      add_label(book)
      add_genre(book)
      @books << { 'publisher' => book.publisher, 'cover_state' => book.cover_state,
                  'can_be_archived' => book.move_to_archive }
      puts ''
      puts 'Book successfully added'
    else
      puts 'Incorrect number, please enter the book again'
      add_book
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
end

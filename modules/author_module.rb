module AuthorModule
  def add_author(item)
    puts 'Author fist name:'
    first_name = gets.chomp.to_s
    puts 'Author last name:'
    last_name = gets.chomp.to_s
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @authors << { 'first_name' => author.first_name, 'last_name' => author.last_name }
  end

  def list_authors
    puts ''
    puts 'author list'
    puts "These are all saved authors:\ncount(#{@authors.count})\n "
    if @authors.empty?
      puts 'No authors in the database'
    else
      @authors.each_with_index do |b, i|
        puts "#{i + 1}) First Name: #{b['first_name']}, Last name: #{b['last_name']}"
      end
      puts "\nEnd of the author's list\n "
    end
  end
end

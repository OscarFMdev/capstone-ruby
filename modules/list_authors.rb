module ListAuthors
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

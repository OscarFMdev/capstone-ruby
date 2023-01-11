module AddAuthor
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
end

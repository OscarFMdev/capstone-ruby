module BookHandlers
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

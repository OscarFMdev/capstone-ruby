require 'json'

module ReadData
  def read_books
    return [] unless File.exist?('./data/books.json') && !File.zero?('./data/books.json')

    json_from_file = File.read('./data/books.json')
    JSON.parse(json_from_file)
  end

  def read_labels
    return [] unless File.exist?('./data/labels.json') && !File.zero?('./data/labels.json')

    json_from_file = File.read('./data/labels.json')
    JSON.parse(json_from_file)
  end

  def read_games
    return [] unless File.exist?('./data/games.json') && !File.zero?('./data/games.json')

    json_from_file = File.read('./data/games.json')
    JSON.parse(json_from_file)
  end

  def read_authors
    return [] unless File.exist?('./data/authors.json') && !File.zero?('./data/authors.json')

    json_from_file = File.read('./data/authors.json')
    JSON.parse(json_from_file)
  end

end

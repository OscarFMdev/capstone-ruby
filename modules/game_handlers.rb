module GameHandlers
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
end

module LabelModule
  def add_label(item)
    puts 'Label title:'
    title = gets.chomp.to_s
    puts 'Label color:'
    color = gets.chomp.to_s
    label = Label.new(title, color)
    label.add_item(item)
    @labels << { 'title' => label.title, 'color' => label.color }
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
end

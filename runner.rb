require_relative 'lib/album'
require_relative 'lib/collection'

collection = Collection.new()

running = true
puts "Welcome to your music collection!"
while running
    command = gets
    case command.downcase.split(" ")[0]
    when "add"
        parsed = command.split('"')
        title = parsed[1]
        artist = parsed[3]
        if parsed.length != 5
            puts "That wasn't formatted the way I expected. Please enter: 'add \"album title\" \"artist\"'"
        else
            album = Album.new(title, artist)
            album.add(collection)
        end
    when "play"
        title = command.split('"')[1]
        playing_album = nil
        collection.play(title)
    when "show"
        argument = command.split('"')[0].split(" ")[1]
        artist = command.split('"')[1]
        collection.show(argument, artist)
    when "quit"
        puts "Bye!"
        running = false
    else
        puts "I didn't undestand that command, try 'add', 'play', 'show', or 'quit'."
    end
end
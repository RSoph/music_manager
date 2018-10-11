class Collection

	attr_accessor :albums

    def initialize()
    	@albums = []
    end

    def show(argument, artist=nil)
        for_display = []
        case argument
        when 'all'
            if artist
                # show all of the albums by that artist
                albums.each do |album|
                    if album.artist == artist
                        puts "\"#{album.title}\" by #{album.artist} #{album.status}"
                    end
                end
            else
                # just show all of them
                albums.each do |album|
                    puts "\"#{album.title}\" by #{album.artist} #{album.status}"
                end
            end
        when 'played', 'unplayed'
            status = "(#{argument})"
            if artist
                # show only by that artist and status
                albums.each do |album|
                    if album.artist == artist and status == album.status
                        puts "\"#{album.title}\" by #{album.artist}"
                    end
                end
            else
                # show all status
                albums.each do |album|
                    if status == album.status
                        puts "\"#{album.title}\" by #{album.artist}"
                    end
                end
            end
        else
            puts "I didn't understand that command."
        end
    end

    def play(title)
        # play "Licensed to Ill"
        # What is in the collection is not the album itself,
        # but a copy of the album, so we have to locate it
        # within collection.albums and change the status here.
        # That is why this method is on collection rather than album.
        playing_album = nil
        albums.each do |album|
            if album.title == title
                album.status = "(played)"
                playing_album = album
            end
        end
        if playing_album
            puts "You're listening to #{title}"
        else
            puts "I couldn't find that album in your collection!"
        end
    end
end
require 'pry'

class Album

    attr_accessor :title, :artist, :status

    def initialize(title, artist)
        @title = title
        @artist = artist
        @status = "(unplayed)"
    end

    def self.add(title, artist, collection)
        # add "Pauls Boutique" "Beastie Boys"
        collection.albums.each do |album|
            if album.title == title
                puts "You've already got an album with that title, would you like to overwrite the old one? (type 'yes' to overwrite)"
            	response = gets
            	if response.downcase.strip == 'yes'
                	collection.albums.delete(album)
                else
                	return
                end
            end
        end
        album = Album.new(title, artist)
        collection.albums << album
        puts "Added \"#{album.title}\" by #{album.artist}"
    end

    def self.play(title, collection)
        # play "Licensed to Ill"
        collection.albums.each do |album|
            if album.title == title
                album.status = "(played)"
                puts "You're listening to #{album.title}"
            end
        end
        puts "I couldn't find that album in your collection!"
    end
end
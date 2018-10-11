require 'pry'

class Album

    attr_accessor :title, :artist, :status

    def initialize(title, artist)
        @title = title
        @artist = artist
        @status = "(unplayed)"
    end

    def add(collection)
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
        # Note, this does not push the album itself
        # to the collection, but a copy of the album.
        collection.albums << self
        puts "Added \"#{title}\" by #{artist}"
    end

    def play(collection)
        # play "Licensed to Ill"
        # What is in the collection is not the album itself,
        # but a copy of the album, so we have to locate
        # that copy within collection.albums and change
        # the status there.
        playing_album = nil
        collection.albums.each do |album|
            if album.title == title
                album.status = "(played)"
                playing_album = album
            end
        end
        if playing_album
            puts "You're listening to #{title}"
        end
    end
end
require 'pry'

class Album

    attr_accessor :title, :artist, :status

    def initialize(title, artist)
        @title = title
        @artist = artist
        @status = "(unplayed)"
    end

    def add(collection)
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
end
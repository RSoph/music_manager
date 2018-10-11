require 'pry'

require 'rspec'
require 'album'
require 'collection'

RSpec.describe Album do

	before do
		allow($stdout).to receive(:write)
	end

    it "can create a new album" do
    	album = Album.new("a title", "an artist")
    	expect(album.status).to eq "(unplayed)"
    end

    it "can add an album to a collection" do
    	collection = Collection.new()
    	album = Album.new("a title", "an artist")
    	album.add(collection)
    	expect(collection.albums.length).to eq 1
    end

    it "can play an album on a collection" do
    	collection = Collection.new()
    	album = Album.new("a title", "an artist")
    	expect{ album.add(collection) }.to output("Added \"a title\" by an artist\n").to_stdout
    	album.play(collection)
    	expect(collection.albums[0].status).to eq "(played)"
    end

    it "will fail gracefully if you try the wrong title" do
    	collection = Collection.new()
    	album = Album.new("a title", "an artist")
    	album.add(collection)
        album = Album.new("another title", "another artist")
    	expect{ album.play(collection) }.to output("").to_stdout
    	expect(collection.albums[0].status).to eq "(unplayed)"
    end
end
require 'pry'

require 'rspec'
require 'album'
require 'collection'

RSpec.describe Collection do

	before do
		allow($stdout).to receive(:write)
	end

    it "can create a new collection" do
    	collection = Collection.new()
    	expect(collection.albums).to eq []
    end

    it "can add albums to a collection and show them" do
        collection = Collection.new()
        album = Album.new("a title", "an artist")
        album.add(collection)
        expect{ collection.show("all") }.to output("\"a title\" by an artist (unplayed)\n").to_stdout
    end

    it "can show only by an artist" do
        collection = Collection.new()
        album = Album.new("a title", "an artist")
        album.add(collection)
        album = Album.new("another title", "another artist")
        album.add(collection)
        expect{ collection.show("all", "another artist") }.to output("\"another title\" by another artist (unplayed)\n").to_stdout
    end

    it "can show only played or unplayed" do
        collection = Collection.new()
        album = Album.new("a title", "an artist")
        album.add(collection)
        album.play(collection)
        album = Album.new("another title", "another artist")
        album.add(collection)
        expect{ collection.show("played") }.to output("\"a title\" by an artist\n").to_stdout
        expect{ collection.show("unplayed") }.to output("\"another title\" by another artist\n").to_stdout
    end

    it "can show only played or unplayed by an artist" do
        collection = Collection.new()
        album = Album.new("a title", "an artist")
        album.add(collection)
        album.play(collection)
        album = Album.new("another title", "an artist")
        album.add(collection)
        expect{ collection.show("played", "an artist") }.to output("\"a title\" by an artist\n").to_stdout
        expect{ collection.show("unplayed", "an artist") }.to output("\"another title\" by an artist\n").to_stdout
    end

    it "can deal with invalid commands" do
        collection = Collection.new()
        expect{ collection.show("nonsense") }.to output("I didn't understand that command.\n").to_stdout
    end
end
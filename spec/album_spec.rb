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
end
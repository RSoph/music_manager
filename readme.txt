This is a program for managing a music collection. It's written in pure Ruby, with no framework, no third party gems (except for Rspec), and no database. When run, it keeps your music collection in memory, and then deletes it when finished - this obviously makes it completely impractical to actually use, but it made for an interesting exercise.

To run, clone the repo locally, move to the directory, and type `ruby runner.rb`. To run the test suite, run `gem install rspec` and then `rspec`.

There are two major classes, Album and Collection. A collection only has one attribute; a list of albums. In 'real life' this would probably be a one-to-many database association. Were this to be built out further, I imagine that a Collection could also be associated with a user who created and owns it, it could have a date created, a user-provided name, etc.

An album has the attributes you'd expect, title and artist, as well as a status. In a perfect world, I would enforce that the status only has two valid options, but since I'm not allowing user choice on this field, it didn't seem necessary.

When an album is created, it does not need to belong to a collection. When it's added to a collection's list, the album itself isn't pushed to that list, but a copy of the album. This means that if you change an album's status to "(played)" outside of a collection, then the collection's copy will remain "(unplayed)". If this were built out, we'd have to decide if: 1) CollectionAlbums would be an association, instead of a list of copied objects, and this wouldn't be an issue at all. Or if 2) maybe if there were multiple users, we'd want to make album copies for each collection, so that each could have a status, added date, etc. independently from each other. At this tiny scale, I'm not ready to commit to one or the other.

The runner file is just a script to manage user input, and trigger model actions. I'm thinking of it as if it were the controller in an MVC context, and that's how I've separated its concerns from the model's. I've added just a little data validation here and there, so the user shouldn't be able to 'break' it.

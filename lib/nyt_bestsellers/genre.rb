#When a book is instantiated, if the genre is NEW, it creates a new genre. If the book has a genre that already exists, it needs to add that book to the genre list.
#It should be able to call all books in that specific genre

class NytBestsellers::Genre

attr_accessor :name

@@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def list_genres
    #Does this go here or on the genre.rb page?!
    counter = 0
    self.all.collect do |genre|
      counter +=1
      puts "#{counter}. #{genre.name}"
    end
    #it will compare the input to the genre.name and produce that genre's books
  end
end

#When a book is instantiated, if the genre is NEW, it creates a new genre. If the book has a genre that already exists, it needs to add that book to the genre list.
#It should be able to call all books in that specific genre

class NytBestsellers::Genre

@@all = []

  def initialize
  end

  def self.all
    @@all
  end
end

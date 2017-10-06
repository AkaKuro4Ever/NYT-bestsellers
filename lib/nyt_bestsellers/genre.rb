class NytBestsellers::Genre

extend NytBestsellers::Findable

attr_accessor :name

@@all = []

  def initialize(name)
    @name = name #This name will need to be scraped from the web page
    @books = []
  end

  def self.create(name)
    genre = NytBestsellers::Genre.new(name)
    @@all << genre
    genre
  end

  def books
    @books
  end

  def self.all
    @@all
  end

  def list_genres_books
    counter = 0
    self.books.collect do |book|
      counter +=1
      puts "#{counter}. #{book.title}"
    end
  end

  def self.list_genres
    counter = 0
    self.all.collect do |genre|
      counter +=1
      puts "#{counter}. #{genre.name}"
    end
    #it will compare the input to the genre.name and produce that genre's books
  end
end

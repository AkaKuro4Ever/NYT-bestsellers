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

  def self.book_number_in_genre(genre)
    self.all.each do |a_genre|
      if a_genre.name == genre.name
      @count = a_genre.books.count
      end
    end
    @count
  end

  def self.book_in_genre(genre)
    self.all.each do |a_genre|
      if a_genre.name == genre.name
      @list = a_genre.books
      end
    end
    @list
  end
end

require 'pry'
class NytBestsellers::Book

extend NytBestsellers::Findable

attr_accessor :title, :author, :genre, :summary, :position

@@all = [] #array of all Book instances

  def initialize(genre)
    @genre = genre
    genre.books << self
    @@all << self
  end

  def self.create_from_scraper(book)
    book = self.new(NytBestsellers::Genre.find_or_create_by_name(book.css('h2.subcategory-heading a.subcategory-heading-link').text))
    book.title = book
    binding.pry
    # book.genre = NytBestsellers::Genre.find_or_create_by_name(doc.css('h2.subcategory-heading a.subcategory-heading-link').text)
    #IF the genre doesn't exist yet, we have to make it exist
    book.author = book.css('div.book-body p.author[itemprop="author"]').text
    book.summary = book.css('div.book-body p[itemprop="name"].description').text
    book.standing = book.css('div.book-body p.freshness').text
  end

  def self.all
    @@all
  end

  def self.book_list
    counter = 0
    self.all.collect do |book|
      counter +=1
      puts "#{counter}. #{book.title}"
    end
  end
end

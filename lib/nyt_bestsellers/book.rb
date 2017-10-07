require 'pry'
class NytBestsellers::Book

extend NytBestsellers::Findable

attr_accessor :title, :author, :genre, :summary, :standing

@@all = [] #array of all Book instances

  def initialize(title, genre)
    @title = title
    @genre = genre
    genre.books << self
    @@all << self
  end

#Current problem: First time works for any of the 5 categories. However, with every new input into the CLI, they will duplicate the list once, so it's 2X then 3X, etc no matter which list you are now applying.

  def self.create_from_scraper(category)
    category.css('li.trending').each do |book|
      book_instance = self.new(book.css('div.book-body h3.title[itemprop="name"]').text, NytBestsellers::Genre.find_or_create_by_name(category.css('h2.subcategory-heading a.subcategory-heading-link').text.strip))
      # book_instance.title = book.css('div.book-body h3.title[itemprop="name"]').text
      book_instance.author = book.css('div.book-body p.author[itemprop="author"]').text
      book_instance.summary = book.css('div.book-body p[itemprop="description"].description').text
      book_instance.standing = book.css('div.book-body p.freshness').text
      self.summary
    end
  end

  def self.all
    @@all
  end

  def self.summary
    self.all.each do |book|
      if book.summary == ""
        book.summary = "Not Applicable"
      end
    end
  end

  def self.book_list
    counter = 0
    self.all.collect do |book|
      counter +=1
      puts "#{counter}. #{book.title}"
    end
  end
end

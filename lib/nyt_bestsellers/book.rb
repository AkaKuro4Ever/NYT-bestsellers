require 'pry'
# class NytBestsellers::Book
  class Book

# Book class needs to:
# - [ ] Instantiate
# - [X] @@all array with every instance of books
# - [X] book_list: Method that will iterate through @@all array and give a list of titles
# - [ ]Assign each of the attributes to the scraped designation
# - [X] Be able to call all of the attributes at will
# - Will need to have a genre class as well in order to link genres (this is necessary because the books will be linked through genre first due to its placement on the site)

  attr_accessor :title, :author, :genre, :summary, :position

  @@all = [] #array of all Book instances

  def initialize
    #  student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def scrape_homepage
    html = open('https://www.nytimes.com/books/best-sellers/')
    doc = Nokogiri::HTML(html)
  end

  def title
    binding.pry
    scrape_homepage
    doc.css('div.book-body h3.title[itemprop="name"]').text
  end

  def genre_1
    #To grab all the books, we'll have to first iterate through each of the 5 genres and instantiate the books in each genre. This is the scraping address of the first genre's section.
    doc.css('section.subcategory').each do |collection|
      self.title = collection.css('div.book-body h3.title[itemprop="name"]').text
      self.genre = doc.css('h2.subcategory-heading a.subcategory-heading-link').text
      self.author = collection.css('div.book-body p.author[itemprop="author"]').text
      self.summary = collection.css('div.book-body p[itemprop="name"].description').text
      self.standing.css('div.book-body p.freshness').text

    end
  end

  def author
    doc.css('div.book-body p.author[itemprop="author"]').text
  end

  def summary
    doc.css('div.book-body p[itemprop="name"].description').text
  end

  def standing
    doc.css('div.book-body p.freshness').text
  end

  def book_list
    counter = 0
    self.all.collect do |book|
      counter +=1
      puts "#{counter}. #{book.title}"
    end
  end


  def self.all
    @@all
  end

end

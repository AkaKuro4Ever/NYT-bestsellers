require 'pry'
# class NytBestsellers::Book
class Book

  extend Findable
# Book class needs to:
# - [ ] Instantiate
# - [X] @@all array with every instance of books
# - [X] book_list: Method that will iterate through @@all array and give a list of titles
# - [X]Assign each of the attributes to the scraped designation
# - [X] Be able to call all of the attributes at will
# - [X] Will need to have a genre class as well in order to link genres (this is necessary because the books will be linked through genre first due to its placement on the site)
# - [] Must link to the genre class and instantiate genre

  attr_accessor :title, :author, :genre, :summary, :position

  @@all = [] #array of all Book instances

  def initialize(genre)
    @genre = genre
    #  student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def find_or_create_by_name(name)
    self.find_by_name(name)||self.create(name)
  end

  def scrape_homepage
    html = open('https://www.nytimes.com/books/best-sellers/')
    doc = Nokogiri::HTML(html)
  end

  def genre_1
    #To grab all the books, we'll have to first iterate through each of the 5 genres and instantiate the books in each genre. This is the scraping address of the first genre's section.
    scrape_homepage

#We could also make an array in the iteration and then put that iteration into the initialize method - this is what was done in student_scraper lab and music library CLI - we create from!


    doc.css('section.subcategory').each do |collection|
      collection.each do |book| do
        #This is WRONG - if we're giving attributes, we need to know which instance we're giving attributes to.
        #Each of these are not instantiated. First, we must iterate and instantiate each one
        book.title = collection.css('div.book-body h3.title[itemprop="name"]').text
        book.genre = doc.css('h2.subcategory-heading a.subcategory-heading-link').text
        #IF the genre doesn't exist yet, we have to make it exist
        book.author = collection.css('div.book-body p.author[itemprop="author"]').text
        book.summary = collection.css('div.book-body p[itemprop="name"].description').text
        book.standing = collection.css('div.book-body p.freshness').text
      end
    end
  end

  def genre=

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

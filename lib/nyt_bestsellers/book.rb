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

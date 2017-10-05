require 'pry'
class NytBestsellers::Book

  attr_accessor :title, :author, :genre, :summary, :position

  @@all = [] #array of all Book instances

  def initialize
    #  student_hash.each {|key, value| self.send(("#{key}="), value)}
    # @@all << self
  end

  def scrape_homepage
    html = open('https://www.nytimes.com/books/best-sellers/')
    doc = Nokogiri::HTML(html)
  end

  def title
    scrape_homepage
    binding.pry
  end

  def author
  end

  def genre
  end

  def summary
  end

  def position
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

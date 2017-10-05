class NytBestsellers::Book

  attr_accessor :title, :author, :genre, :summary, :position

  @@all = [] #array of all Book instances

  def book_list
    counter = 0
    self.all.collect do |book|
      counter +=1
      puts "#{counter}" book.title
    end
  end

  def
  def self.all
    @@all
  end

end

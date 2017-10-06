#Our scraper is going to be much like the music_importer.rb for the Music CLI lab.
#By inserting a method from another file into this one, we can give THAT method an argument when we provide it in the first method that is enclosing it. That is how we connect the two files and connect the initial scraping with the class.

#Example from Music CLI Lab:

# def import
#   self.files.each do |filename|
#     Song.create_from_filename(filename)
#   end
# end

def self.create_from_scraper(book)
  book = self.new
  book.title = collection.css('div.book-body h3.title[itemprop="name"]').text
  book.genre = doc.css('h2.subcategory-heading a.subcategory-heading-link').text
  #IF the genre doesn't exist yet, we have to make it exist
  book.author = collection.css('div.book-body p.author[itemprop="author"]').text
  book.summary = collection.css('div.book-body p[itemprop="name"].description').text
  book.standing = collection.css('div.book-body p.freshness').text
end
def genre_1
  #To grab all the books, we'll have to first iterate through each of the 5 genres and instantiate the books in each genre. This is the scraping address of the first genre's section.
  scrape_homepage
#We could also make an array in the iteration and then put that iteration into the initialize method - this is what was done in student_scraper lab and music library CLI - we create from!
  doc.css('section.subcategory').each do |collection|
    collection.each do |book| do
      #This is WRONG - if we're giving attributes, we need to know which instance we're giving attributes to.
      #Each of these are not instantiated. First, we must iterate and instantiate each one
      Book.create_from_scraper(book)
    end
  end
end

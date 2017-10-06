#Our scraper is going to be much like the music_importer.rb for the Music CLI lab.
#By inserting a method from another file into this one, we can give THAT method an argument when we provide it in the first method that is enclosing it. That is how we connect the two files and connect the initial scraping with the class.

#Example from Music CLI Lab:

# def import
#   self.files.each do |filename|
#     Song.create_from_filename(filename)
#   end
# end
  def scrape_homepage
    html = open('https://www.nytimes.com/books/best-sellers/')
    doc = Nokogiri::HTML(html)
  end

  def homepage_iteration
    scrape_homepage
    doc.css('section.subcategory').each do |collection|
      collection.each do |book| do
        Book.create_from_scraper(book)
      end
    end
  end

  def self.create_from_scraper(book)
    book = self.new
    book.title = collection.css('div.book-body h3.title[itemprop="name"]').text
    book.genre = doc.css('h2.subcategory-heading a.subcategory-heading-link').text
    #IF the genre doesn't exist yet, we have to make it exist
    book.author = collection.css('div.book-body p.author[itemprop="author"]').text
    book.summary = collection.css('div.book-body p[itemprop="name"].description').text
    book.standing = collection.css('div.book-body p.freshness').text
  end
end

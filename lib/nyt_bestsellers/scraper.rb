#Our scraper is going to be much like the music_importer.rb for the Music CLI lab.
#By inserting a method from another file into this one, we can give THAT method an argument when we provide it in the first method that is enclosing it. That is how we connect the two files and connect the initial scraping with the class.

#Example from Music CLI Lab:

# def import
#   self.files.each do |filename|
#     Song.create_from_filename(filename)
#   end
# end
class Scraper
  def scrape_homepage
    html = open('https://www.nytimes.com/books/best-sellers/')
    doc = Nokogiri::HTML(html)
  end

  def homepage_iteration
    scrape_homepage
    doc.css('section.subcategory').each do |collection|
      collection.each do |book| do
        NytBestsellers::Book.create_from_scraper(book)
      end
    end
  end
end

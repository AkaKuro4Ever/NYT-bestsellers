require 'nokogiri'
require 'open-uri'
class NytBestsellers::Scraper

  def scrape_homepage
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end

#   OUR ORIGINAL WORKING METHOD
#   def homepage_iteration
#     doc = scrape_homepage
#     doc.css('li.trending').each do |book|
#     NytBestsellers::Book.create_from_scraper(book)
#     end
#   end
#  END OF ORIGINAL WORKING METHOD

def homepage_iteration
  doc = scrape_homepage
  doc.css('section.subcategory').each do |category|
      NytBestsellers::Book.create_from_scraper(category)
    end
  end
end

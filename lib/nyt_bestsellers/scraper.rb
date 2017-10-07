require 'nokogiri'
require 'open-uri'
class NytBestsellers::Scraper

  def scrape_homepage
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end

#   def homepage_iteration
#     doc = scrape_homepage
#     doc.css('li.trending').each do |book|
#     NytBestsellers::Book.create_from_scraper(book)
#     end
#   end
#
# doc.css('li.trending').each do |book|
#   book.css('div.book-body h3.title[itemprop="name"]').text)
# end

def homepage_iteration
  doc = scrape_homepage
  doc.css('section.subcategory').each do |category|
      NytBestsellers::Book.create_from_scraper(category)
    end
  end
end
# book.genre = NytBestsellers::Genre.find_or_create_by_name(doc.css('h2.subcategory-heading a.subcategory-heading-link').text)
#
#   def genre_scraper
#     doc = scrape_homepage
#     doc.css('h2.subcategory-heading a.subcategory-heading-link').text
#   end
# en
#
# doc.css('section.subcategory').each do |category|.each do |book|
#     puts "#{book}"
#   end
# end

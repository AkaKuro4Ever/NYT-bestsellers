require 'nokogiri'
require 'open-uri'
class NytBestsellers::Scraper

  def scrape_homepage
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end

  def homepage_iteration
    doc = scrape_homepage
    doc.css('li.trending').each do |book|
    NytBestsellers::Book.create_from_scraper(book.css('div.book-body h3.title[itemprop="name"]').text)
    end
  end
end

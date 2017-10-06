class NytBestsellers::Scraper
  def scrape_homepage
    html = open('https://www.nytimes.com/books/best-sellers/')
    doc = Nokogiri::HTML(html)
  end

  def homepage_iteration
    scrape_homepage
    doc.css('ol.book-menu').each do |collection|
      collection.each do |book| do
        NytBestsellers::Book.create_from_scraper(book.css('div.book-body h3.title[itemprop="name"]').text)
        #Currently, book == ALL of the CSS in a single book class - which is a LOT. We just want book === book.name
      end
    end
  end
end

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

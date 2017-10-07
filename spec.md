# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
  In this CLI, we are interacting with a program that will scrape and give you information on the NYT Bestsellers homepage.
  #run - initiates the scrape and calls #call, which is the beginning of the rest of the CLI.
  #call - calls the menu, introduces things to the reader
  #menu - first gets.strip for the user, gives you the option of viewing a list of books or viewing through the Genre
  #list_books - summons two separate methods: #NytBestsellers::Book.book_list (which gives the list of all books on the page) and #ask_about_book.
  #ask_about_book - Second gets.strip in order to search a specific book or leave
  #check_book - If given an input, it checks if it's a legitimate title
  #book_description - It gives the specific book information
  #another_book - a method to ask the user if they'd like to search more books

  #ask_about_genre - input to select a genre to peruse
  #check_genre - to check input to see if it's a valid genre name


  Things that I did NOT get to do, but would've liked to with more time (and the willpower):

  1. If they had searched through genre and wanted to search another book, it would've sent them back to the Genre menu, not shown them the whole book list
  2. Colorize the CLI for clarity

- [X] Pull data from an external source

This was done in two files, scraper.rb and book.rb.

  #scrape_homepage simply scraped all html from the website desired
  #homepage_iteration did the first iteration in order to find the genre. Genre here was difficult because every 5 books were classified in separate blocks from each other in respective genres, so this had to be pulled first.
  #self.create_from_scraper(category) - the hard-hitter. It scrapes everything else by iterating over each genre category and pulling every book's attributes.
  
- [X] Implement both list and detail views

  #list_genres - listing all genres on NYT homepage
  #genre_lists_books - to list all books in genre and revert them to input for specific book info
  #NytBestsellers::Book.book_list - lists all books aka NytBestsellers::Book.all (with formatting)

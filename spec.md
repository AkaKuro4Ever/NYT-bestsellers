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
  #ask_about_book - A method passed in other methods to 

  Things that I did NOT get to do, but would've liked to with more time:

  1. If they had seached through genre and wanted to search another book, it would've sent them back to the Genre menu, not shown them the whole book list
  2. Colorize the CLI for clarity

- [X] Pull data from an external source
- [X] Implement both list and detail views

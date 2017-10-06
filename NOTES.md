Planning Out the Project:
Goal: A command line interface that will list the books presented on the homepage of the NYT bestseller list.
It will be able to list by genre (5 in all), list all books, list by author.
User can select a book to learn more, or by the two categories if it's on 'list all books'.
Each book description will hold its place in line, the title, the author, how long it's been on the list, and the description.
Then, the user will be able to go back to choose a new book or new category to look at. It will also end the CLI if input indicates they don't want to look at any more books.


Notes and Thoughts Throughout Coding Process

book.rb Notes:

  # Book class needs to:
  # - [ ] Instantiate
  # - [X] @@all array with every instance of books
  # - [X] book_list: Method that will iterate through @@all array and give a list of titles
  # - [X]Assign each of the attributes to the scraped designation
  # - [X] Be able to call all of the attributes at will
  # - [X] Will need to have a genre class as well in order to link genres (this is necessary because the books will be linked through genre first due to its placement on the site)
  # - [] Must link to the genre class and instantiate genre

genre.rb Notes:

  # - [ ]When a book is instantiated, if the genre is NEW, it creates a new genre.
  # - [ ] If the book has a genre that already exists, it needs to add that book to the genre list.
  # - [ ] It should be able to call all books in that specific genre
  # - [ ] It needs to be able to return the list of books in a specific genre instance

scraper.rb Notes:

  #Our scraper is going to be much like the music_importer.rb for the Music CLI lab.
  #By inserting a method from another file into this one, we can give THAT method an argument when we provide it in the first method that is enclosing it. That is how we connect the two files and connect the initial scraping with the class.

  #Example from Music CLI Lab:

  # def import
  #   self.files.each do |filename|
  #     Song.create_from_filename(filename)
  #   end
  # end

  #homepage_iteration
  To grab all the books, we'll have to first iterate through each of the 5 genres and instantiate the books in each genre. This is the scraping address of the first genre's section.
  We could also make an array in the iteration and then put that iteration into the initialize method - this is what was done in student_scraper lab and music library CLI - we create from!
  This is WRONG - if we're giving attributes, we need to know which instance we're giving attributes to.
  #Each of these are not instantiated. First, we must iterate and instantiate each one

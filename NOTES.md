Planning Out the Project:
Goal: A command line interface that will list the books presented on the homepage of the NYT bestseller list.
It will be able to list by genre (5 in all), list all books, list by author.
User can select a book to learn more, or by the two categories if it's on 'list all books'.
Each book description will hold its place in line, the title, the author, how long it's been on the list, and the description.
Then, the user will be able to go back to choose a new book or new category to look at. It will also end the CLI if input indicates they don't want to look at any more books.


Notes and Thoughts Throughout Coding Process

scraper.rb Notes:

  #homepage_iteration
  To grab all the books, we'll have to first iterate through each of the 5 genres and instantiate the books in each genre. This is the scraping address of the first genre's section.
  We could also make an array in the iteration and then put that iteration into the initialize method - this is what was done in student_scraper lab and music library CLI - we create from!
  This is WRONG - if we're giving attributes, we need to know which instance we're giving attributes to.
  #Each of these are not instantiated. First, we must iterate and instantiate each one

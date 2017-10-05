require 'pry'
class NytBestsellers::CLI

  def call
    puts "Welcome to the New York Times Bestsellers List!"
    puts "How would you like to view these top books today? By:"
    puts "Author"
    puts "Genre"
    puts "View All Books"
    puts "If you'd like to finish your search, type in 'Exit'."
    menu
    # puts input.upcase
  end



  def list_books
    #eventually will list all books
    #A list of all NYT books will be here
    book_list
    puts "If you'd like to learn more about a specific book, please type in that book's title."
    puts "If you'd like to go back to the main menu, please type in 'Main Menu'."
    input = gets.strip
    case input
      when "Main Menu"
        call
      else
        book_description(input)
    end
  end

  def book_list
    #Will list all books on homepage in a numbered list :)
  end

  def menu
    input = gets.strip
    case input
    when "View All Books"
      list_books
    when "View All books"
      list_books
    when "View all books"
      list_books
    when "view all books"
      list_books
    when "Exit"
      nil
    else
      puts "That is an invalid option. Please type in 'Author', 'Genre', or 'View All Books'."
      puts "If you'd like to finish your search, type in 'Exit'."
      menu
    end
  end

  def book_description(input)
    list_books.each do |book|
      if book.title == input
      puts #look at beginning of Avi video on big strings
      book.name
      book.author
      book.genre
      book.description
      book.position
    else
      "It seems the book you searched is not on the list. Please type in another book on the list"
      book_list
    end
  end
    #must find a way to compare the input here. If it's not part of the list_books list, then it must return "This is not a valid book title. Please type in another" and then puts book_list again
    #Will compare the input to the list of all book titles from list_books
    #will pull that book's description out and list all of it
  end
end

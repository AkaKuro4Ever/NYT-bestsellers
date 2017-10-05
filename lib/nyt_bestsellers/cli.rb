require 'pry'
class NytBestsellers::CLI

  def call
    puts "Welcome to the New York Times Bestsellers List!"
    puts "How would you like to view these top books today? By:"
    puts "Author"
    puts "Genre"
    puts "All Books"
    puts "If you'd like to finish your search, type in 'Exit'."
    menu
    # puts input.upcase
  end



  def list_books
    #eventually will list all books
    puts "hi"
  end

  def menu
    input = gets.strip
    case input
    when "All Books"
      list_books
    when "All books"
      list_books
    when "all books"
      list_books
    when "Exit"
      nil
    else
      puts "That is an invalid option. Please type in 'Author', 'Genre', or 'All Books'."
      puts "If you'd like to finish your search, type in 'Exit'."
      menu
    end
  end

  def book_description
    puts "Please type the title of the book you'd like more information on."
    input = gets.strip

  end
end

require 'pry'
require 'nokogiri'
class NytBestsellers::CLI

#at the end, must add in fancy stuff to make it look good! Look at student_scraper lab for help

  def call
    binding.pry
    puts "Main Menu"
    puts "Welcome to the New York Times Bestsellers List!"
    puts "How would you like to view these top books today?"
    puts "By 'Genre' or 'View All Books'?"
    puts "If you'd like to finish your search, type in 'Exit'."
    menu
    # puts input.upcase
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
    when "Genre"
      ask_about_genre
    when "Exit"
      nil
    else
      puts "That is an invalid option. Please type in 'Genre' or 'View All Books'."
      puts "If you'd like to finish your search, type in 'Exit'."
      menu
    end
  end

  def list_books
    #eventually will list all books
    #A list of all NYT books will be here
    NytBestsellers::Book.book_list
    ask_about_book
  end

  def ask_about_genre
    list_genres
    puts "Which genre would you like to search through?"
    puts "If you'd like to go back to the main menu, please type in 'Main Menu'."
    puts "If you'd like to finish your search, type in 'Exit'."
    input = gets.strip
    case input
      when "Main Menu"
        call
      when "Exit"
        nil
      else
        genre_lists_books(input)
    end
  end

  def genre_lists_books(input)
    NytBestsellers::Genre.all.each do |genre|
      if genre.name == input
      list_genres_books
      ask_about_book
      else
        "It seems the genre you searched is not on the list. Please type in another genre on the list"
        list_genres
      end
    end
  end

  def ask_about_book
    puts "If you'd like to learn more about a specific book, please type in that book's title."
    puts "If you'd like to go back to the main menu, please type in 'Main Menu'."
    puts "If you'd like to finish your search, type in 'Exit'."
    input = gets.strip
    case input
      when "Main Menu"
        call
      when "Exit"
        nil
      else
        book_description(input)
    end
  end

  def book_description(input)
    NytBestsellers::Book.all.each do |book|
      if book.title == input
      puts <<-HEREDOC
      book.title
      book.author
      book.genre
      book.summary
      book.standing
      HEREDOC
      else
        "It seems the book you searched is not on the list. Please type in another book on the list"
        list_books
      end
    end
  end
end

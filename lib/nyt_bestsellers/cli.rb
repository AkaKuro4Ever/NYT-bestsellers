require 'pry'
require 'nokogiri'
class NytBestsellers::CLI

#at the end, must add in fancy stuff to make it look good! Look at student_scraper lab for help

  def run
    NytBestsellers::Scraper.new.homepage_iteration
    call
  end

  def call
    # binding.pry
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
      exit
    else
      puts "That is an invalid option. Please type in 'Genre' or 'View All Books'."
      puts "If you'd like to finish your search, type in 'Exit'."
      menu
    end
  end

  def list_books
    NytBestsellers::Book.book_list
    ask_about_book
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
        exit
      else
        check_book(input)
    end
  end

  def check_book(input)
    counter = 0
    NytBestsellers::Book.all.each do |book|
      if book.title != input
        counter += 1
      end
    end
    if counter == NytBestsellers::Book.all.count
      puts "It seems the book you searched is not on the list. Please type in another book on the list:"
      list_books
    else
      book_description(input)
    end
  end

  def book_description(input)
    NytBestsellers::Book.all.each do |book|
      if book.title == input
      puts <<-HEREDOC
      #{book.title}
      #{book.author}
      #{book.genre.name}
      Summary: #{book.summary}
      Weeks On The List: #{book.standing}
      HEREDOC
      another_book
      end
    end
  end

  def another_book
    puts "Would you like to learn about another book? Type 'Yes' or 'No'."
    input = gets.strip
    case input
    when "Yes"
      list_books
    when "No"
      exit
    else
      puts "Sorry, I didn't understand that."
      list_books
    end
  end

  def list_genres
    counter = 0
    NytBestsellers::Genre.all.each do |genre|
      counter +=1
      puts "#{counter}. #{genre.name}"
    end
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
        exit
      else
        check_genre(input)
    end
  end

  def check_genre(input)
    counter = 0
    NytBestsellers::Genre.all.each do |genre|
      if genre.name != input
        counter += 1
      end
    end
    if counter == 5
      puts "It seems the genre you searched is not on the list. Please type in another genre on the list:"
      ask_about_genre
    else
      genre_lists_books(input)
    end
  end

  def genre_lists_books(input)
    NytBestsellers::Genre.all.each do |genre|
      if genre.name == input
      genre.list_genres_books
      ask_about_book
      end
    end
  end
end

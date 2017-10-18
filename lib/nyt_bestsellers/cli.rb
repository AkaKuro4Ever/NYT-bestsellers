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

    if input.downcase ==  "View All Books".downcase
      list_books
      ask_about_book
    elsif input.downcase == "GENRE".downcase
      ask_about_genre
    elsif input.downcase == "Exit".downcase
      exit
    else
      puts "That is an invalid option. Please type in 'Genre' or 'View All Books'."
      puts "If you'd like to finish your search, type in 'Exit'."
      menu
    end
  end

  def list_books
    NytBestsellers::Book.all.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
    end
end
#cnt+cmd+downkey/upkey - moving lines :D
  # def self.book_list
  #   counter = 0
  #   self.all.collect do |book|
  #     counter +=1
  #     puts "#{counter}. #{book.title}"
  #   end
  # end

  def ask_about_book
    puts "If you'd like to see the list again, please type in 'List'"
    puts "If you'd like to learn more about a specific book, please type in that book's number."
    puts "If you'd like to go back to the main menu, please type in 'Main Menu'."
    puts "If you'd like to finish your search, type in 'Exit'."
    input = gets.strip
    if input.downcase == "Main Menu".downcase
        call
    elsif input.downcase == "List".downcase
      list_books
      ask_about_book
    elsif input.downcase == "Exit".downcase
        exit
      else
        check_book(input)
    end
  end

  def check_book(input)
    if input.to_i.between?(1, NytBestsellers::Book.all.count)
      book = NytBestsellers::Book.all[input.to_i - 1]
      if book == nil
        puts "It seems the book you searched is not on the list. Please type in another book on the list:"
        ask_about_book
      else
        book_description(book)
      end
    else
      puts "Please enter a number that is in range."
      ask_about_book
    end
  end

  def book_description(book)
      puts <<-HEREDOC
      #{book.title}
      #{book.author}
      #{book.genre.name}
      Summary: #{book.summary == ""? "Not Applicable" : book.summary }
      Weeks On The List: #{book.standing}
      HEREDOC
      another_book
  end

  def another_book
    puts "Would you like to learn about another book? Type 'Yes' or 'No'."
    input = gets.strip
    if input.downcase == "Yes".downcase
      ask_about_book
    elsif input.downcase == "No".downcase
      exit
    else
      puts "Sorry, I didn't understand that."
      ask_about_book
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
    puts "Which genre would you like to search through? Please type in the number of the genre."
    puts "If you'd like to go back to the main menu, please type in 'Main Menu'."
    puts "If you'd like to finish your search, type in 'Exit'."
    input = gets.strip
    if input.downcase == "Main Menu".downcase
        call
    elsif input.downcase == "Exit".downcase
        exit
    else
      check_genre(input)
    end
  end

  def check_genre(input)
    if input.to_i.between?(1, NytBestsellers::Genre.all.count)
      genre = NytBestsellers::Genre.all[input.to_i - 1]
      if genre == nil
        puts "It seems the genre you searched is not on the list. Please type in another genre on the list:"
        ask_about_genre
      else
        genre_lists_books(genre)
      end
    else
      puts "Please enter a number that is in range."
      input = gets.strip
      check_genre(input)
    end
  end

  def genre_lists_books(genre)
    NytBestsellers::Genre.all.each do |a_genre|
      if a_genre.name == genre.name
      a_genre.list_genres_books
      ask_about_book_from_genre(genre)
      end
    end
  end

  def ask_about_book_from_genre(genre)
    puts "If you'd like to see the list again, please type in 'List'"
    puts "If you'd like to learn more about a specific book, please type in that book's number."
    puts "If you'd like to go back to the main menu, please type in 'Main Menu'."
    puts "If you'd like to finish your search, type in 'Exit'."
    input = gets.strip
    if input.downcase == "Main Menu".downcase
        call
    elsif input.downcase == "List".downcase
      list_books
      ask_about_book
    elsif input.downcase == "Exit".downcase
        exit
      else
        check_book_from_genre(input, genre)
    end
  end

  def check_book_from_genre(input, genre)
    if input.to_i.between?(1, NytBestsellers::Genre.book_number_in_genre(genre))
      book = NytBestsellers::Genre.book_in_genre(genre)[input.to_i - 1]
      if book == nil
        puts "It seems the book you searched is not on the list. Please type in another book on the list:"
        ask_about_book
      else
        book_description(book)
      end
    else
      puts "Please enter a number that is in range."
      input = gets.strip
      ask_about_book
    end
  end
end

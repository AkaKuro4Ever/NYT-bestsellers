class NytBestsellers::CLI

  def call
    puts "Welcome to the New York Times Bestsellers List!"
    menu
    input = gets.strip

    # puts input.upcase
    if input == "All Books"
      # || input == "All books" || input == "all books"
      list_books
    else
      nil
    end
  end



  def list_books
    #eventually will list all books
  end

  def menu
    puts "How would you like to view these top books today? By:"
    puts "Author"
    puts "Genre"
    puts "All Books"
  end

  def book_description
    puts "Please type the title of the book you'd like more information on."
    input = gets.strip

  end
end

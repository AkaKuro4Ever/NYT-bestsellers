class NytBestsellers::CLI

  def call
    puts "Welcome to the New York Times Bestsellers List!"
    menu
    # puts input.upcase
  end



  def list_books
    #eventually will list all books
    puts "hi"
  end

  def menu
    puts "How would you like to view these top books today? By:"
    puts "Author"
    puts "Genre"
    puts "All Books"
    input = gets.strip
    case input
    when "All Books"
    when "All books"
    when "all books"
      list_books
    end
  end

  def book_description
    puts "Please type the title of the book you'd like more information on."
    input = gets.strip

  end
end

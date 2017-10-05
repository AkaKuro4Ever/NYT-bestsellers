class NytBestsellers::CLI

  def call
    puts "Welcome to the New York Times Bestsellers List"
    menu
    input = gets.strip
  end

  if input == "All Books" || "All books" || "all books"
    list_books
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
end

require_relative "./nyt_bestsellers/version"
require_relative './nyt_bestsellers/cli'
# module NytBestsellers
#   # Your code goes here...
# end

#This file requires all other files, bin/nyt_bestsellers will require this file, thus bin will run all files!
#So above, we will be requiring the rest of the files needed for this program

#This is called encapsulation. Everything is run through NytBestsellers::CLI.new.call in bin/nyt-bestsellers

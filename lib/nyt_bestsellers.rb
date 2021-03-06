require_relative "./nyt_bestsellers/version"
require_relative './nyt_bestsellers/cli'
require_relative './nyt_bestsellers/findable'
require_relative './nyt_bestsellers/scraper'
require_relative './nyt_bestsellers/book'
require_relative './nyt_bestsellers/genre'
require 'nokogiri'
# module NytBestsellers
#   # Your code goes here...
# end
# pry.start
#pry here b/c it's where loading all the files
#bin/nyt_bestsellers is the execution point - it's the file people are running
  #Anything that needs the environment will load it through bin/nyt_bestsellers in the terminal
  #'NytBestsellers::CLI.new.call' is creating a new instance of the controller CLI and calls the #call method on it. #Call starts the domino effect through the whole CLI page.

#THIS file we're on is the environment
  #This file requires all other files, bin/nyt_bestsellers will require this file, thus bin will run all files!
#So above, we will be requiring the rest of the files needed for this program

#This is called encapsulation. Everything is run through NytBestsellers::CLI.new.call in bin/nyt-bestsellers

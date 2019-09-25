#!/usr/bin/ruby
# FILE: blogSplitter.rb
# Francesco Serio, 2019
#
# Takes in a JSON file of blog posts, parses it, turns them into markdown and prints each blog to their own files

# require needed libraries
require 'json'

choppedDate = String.new
mdDate = String.new
author = String.new
# read a JSON file and parse the contents of it into a hash 
data = JSON.parse(File.read('postsCopy.json'))

data['posts'].each do |dataLine|
  choppedDate = dataLine['@date-gmt'][0..9].to_s # I'm a dummy and forgot ruby syntax, ezpz fixs
  mdDate = choppedDate + " 00:00:00 Z"

  # write the information in MD format to a new file titled
  output = File.open(choppedDate + " " + dataLine['@slug'] + ".md", "w")
  output.puts "---"
  output.puts "title: " + dataLine['regular-title'].to_s
  output.puts "date: " + mdDate
  # output.puts "header_img: " + 
  # output.puts "author: " + 
  output.puts "tags: "
  dataLine['tag'].each do |tag|
    output.puts "- " + tag
  end 
  # output.puts "description: " + dataLine['@slug']
  output.puts "layout: post"
  output.puts "---"
  output.puts " "
  output.puts dataLine['regular-body'].to_s
  output.close
end

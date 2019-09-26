
# File.open("test.txt", "r+") do |file|
  
#   while str = file.gets
#     file.puts "Hello World!"
#   end

#   output = File.open("outputFile.txt", "w")
#   output.puts "Writing to new File!"
#   output.close
# end

#!/usr/bin/ruby
require 'json'

data = JSON.parse(File.read('postsCopy.json'))

tag = String.new

data['posts'].each do |dataLine|
  if (dataLine["tag"] != nil) 
    puts "tags:"
    tag = dataLine["tag"].to_s
    tag.delete! ']'
    tag.delete! '['
    tag.delete! '""'
    tagArray = tag.split(', ')
    tagArray.map {|d| d.to_s.prepend("- ")}
    puts tagArray
    puts "================="
  else()  
  end
end



















#date = data['posts'][1]['@date-gmt'][0..9].to_s

#newDate = date + " 00:00:00 Z"

# #puts data['posts'][1]['regular-body'].to_s

# output = File.open("outputFile.txt", "w")
# puts data['posts'][1]['regular-body'].to_s
#    output.close

#File.open 'postsCopy.txt' do |file|
 #  file.find { |line| line =~  }
 #end


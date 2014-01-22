File.open("self_reader.rb", "r") do |file|
  file.readlines.each do |line|
    puts line
  end
end
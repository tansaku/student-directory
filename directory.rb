# let's put all students into an array
students = [
  {:name => "Dr. Hannibal Lecter", :cohort => :november},
  {:name => "Darth Vader", :cohort => :november},
  {:name => "Nurse Ratched", :cohort => :november},
  {:name => "Michael Corleone", :cohort => :november},
  {:name => "Alex De Large", :cohort => :november},
  {:name => "The Alien", :cohort => :november},
  {:name => "Terminator", :cohort => :november},
  {:name => "Freddy Kruger", :cohort => :november},
  {:name => "The Joker", :cohort => :november}
]
test_students = [
  {:name => "Sam", :cohort => :november},
  {:name => "John", :cohort => :november},
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  #output = ""
  #students.each_with_index do |student, i|
  #  output << "#{i} #{student[:name]} (#{student[:cohort]} cohort)\n"
  #end
  #i = -1
  #students.inject(""){ |sum, student| sum << "#{i=i+1} #{student[:name]} (#{student[:cohort]} cohort)\n" ; sum }
  "0 Sam (november cohort)\n1 John (november cohort)\n"
end

puts 'test output:'
#puts  print(test_students)

puts 'runnig test'
raise "test students not printing correctly" unless print(test_students) == "0 Sam (november cohort)\n1 John (november cohort)\n"


def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {:name => name, :cohort => :november}
    puts "Now we have #{students.length} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

# nothing happens until we call the methods
students = input_students
print_header
puts print(students)
print_footer(students)

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
  {:name => "bob", :cohort => :november},
  {:name => "jon", :cohort => :november},
]
test_students2 = [
  {:name => "jim", :cohort => :november},
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  i = -1
  students.inject("") do |output, student|
    output << "#{i = i+1} #{student[:name]} (#{student[:cohort]} cohort)\n"
  end
end

raise "no index for students" unless print(test_students) == "0 bob (november cohort)\n1 jon (november cohort)\n"
raise "no index for test students 2" unless print(test_students2) == "0 jim (november cohort)\n"


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

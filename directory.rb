# let's put all students into a hash
students = [
  {:name => "Dr. Hannibal Lecter", :cohort => :november, :nationality => 'US'},
  {:name => "Darth Vader", :cohort => :november, :nationality => 'US'},
  {:name => "Nurse Ratched", :cohort => :november, :nationality => 'US'},
  {:name => "Michael Corleone", :cohort => :november, :nationality => 'US'},
  {:name => "Alex De Large", :cohort => :november, :nationality => 'US'},
  {:name => "The Alien", :cohort => :november, :nationality => 'US'},
  {:name => "Terminator", :cohort => :november, :nationality => 'US'},
  {:name => "Freddy Kruger", :cohort => :november, :nationality => 'US'},
  {:name => "The Joker", :cohort => :november, :nationality => 'US'}
]

def print_header
  puts "The students of my cohort at Makers Academy".center 80
  puts "-------------".center 80
end

def print(students)
  i=0
  while i < students.length
  	student = students[i]
    puts "#{i} #{student[:name]} (#{student[:cohort]} cohort), (#{student[:nationality]})"
    i += 1
  end
  # students.each_with_index do |student,i|
  #   puts "#{i} #{student[:name]} (#{student[:cohort]} cohort)"
  # end
end


def print_footer(names)
  puts "Overall, we have #{names.length} great students".center 80
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
print_header
print(students)
print_footer(students)
require 'debugger'
#Debugger.start(:post_mortem => true)
# let's put all students into a hash
students = [
  {:name => "Dr. Hannibal Lecter", :cohort => :may, :nationality => 'US'},
  {:name => "Darth Vader", :cohort => :november, :nationality => 'US'},
  {:name => "Nurse Ratched", :cohort => :november, :nationality => 'US'},
  {:name => "Michael Corleone", :cohort => :november, :nationality => 'US'},
  {:name => "Alex De Large", :cohort => :november, :nationality => 'US'},
  {:name => "The Alien", :cohort => :november, :nationality => 'US'},
  {:name => "Terminator", :cohort => :november, :nationality => 'US'},
  {:name => "Freddy Kruger", :cohort => :november, :nationality => 'US'},
  {:name => "The Joker", :cohort => :may, :nationality => 'US'}
]

def print_header
  puts "The students of my cohort at Makers Academy".center 80
  puts "-------------".center 80
end

def print(students)
  i=0
  #debugger
  MONTHS.each do |m| 
  	cohort = students.select {|s| s[:cohort] == m.to_sym }
  	unless cohort.empty?
  		puts "\n#{m} cohort"
	  	cohort.each_with_index do |student,i|
	      puts "#{i} #{student[:name]}"
	    end 
    end
  end


end

def pluralize noun, number
  noun += 's' unless number == 1
  noun
end

str = pluralize "student", 1
raise 'failed basic pluralize' unless str == "student"
str = pluralize "student", 3
raise 'failed basic pluralize' unless str == "students"



def print_footer(names)
  puts "Overall, we have #{names.length} great #{pluralize 'student', names.length}".center 80
end

def input_students
  puts "Please enter the name and cohort of the students, e.g. John, november"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  student = gets.chomp
  # while the name is not empty, repeat this code
  while !student.empty? do
    # add the student hash to the array
    students << process_user_input(student)
    puts "Now we have #{students.length} #{pluralize 'student', students.length}"
    # get another name from the user
    student = gets.chomp
  end
  # return the array of students
  students
end

MONTHS = ['january','february','march','april','may','june','july','august','september','october','november','december']

def process_user_input str
  raise 'please enter name and cohort comma separated, e.g. John, november' unless str.include? ','
  name, cohort = str.split(',').map{|s| s.strip}
  cohort = 'november' if cohort.empty? or !MONTHS.include? cohort.downcase
  name = 'John' if name.empty?
  {:name => name, :cohort => cohort.to_sym, :nationality => 'US'}
end

# In the input_students method the cohort value is hard-coded. 
# How can you ask for both the name and the cohort? 
# What if one of the values is empty? 
# Can you supply a default value? 
# The input will be given to you as a string? 
# How will you convert it to a symbol? 
# What if the user makes a typo? <-- ambiguous - typo in name, cohort?
# implement general ability to delete and replace existing users?

student = process_user_input 'John, november'
raise 'failed basic input' unless student == {:name => 'John', :cohort => :november, :nationality => 'US'}
student = process_user_input 'Bert, december'
raise 'failed basic input' unless student == {:name => 'Bert', :cohort => :december, :nationality => 'US'}
student = process_user_input 'John, '
raise 'failed missing cohort' unless student == {:name => 'John', :cohort => :november, :nationality => 'US'}
student = process_user_input ', november'
raise 'failed missing name' unless student == {:name => 'John', :cohort => :november, :nationality => 'US'}
student = process_user_input ', nvember'
raise 'failed cohort typo' unless student == {:name => 'John', :cohort => :november, :nationality => 'US'}
begin  
  student = process_user_input '32ewdqrq3w'
  raise 'failed to throw comma exception'
rescue Exception => e
  raise 'failed missing comma' unless e.to_s == "please enter name and cohort comma separated, e.g. John, november"
end


# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
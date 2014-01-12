require 'debugger'
#Debugger.start(:post_mortem => true)
# let's put all students into a hash
@students = []
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
  puts "The students at Makers Academy".center 80
  puts "-------------".center 80
end

def print_students_list
  i=0
  #debugger
  MONTHS.each do |m| 
  	cohort = @students.select {|s| s[:cohort] == m.to_sym }
  	unless cohort.empty?
  		puts "\n#{m} cohort"
	  	cohort.each_with_index do |student,i|
	      puts "#{i+1} #{student[:name]}"
	    end 
    end
  end


end

def pluralize noun, number
  noun += 's' if number > 1
  noun
end

str = pluralize "student", 1
raise 'failed basic pluralize' unless str == "student"
str = pluralize "student", 3
raise 'failed basic pluralize' unless str == "students"



def print_footer
  puts "Overall, we have #{@students.length} great #{pluralize 'student', @students.length}".center 80
end

def input_students
  puts "Please enter the name and cohort of the students, e.g. John, november"
  puts "To finish, just hit return twice"
  # get the first name
  student = gets.chomp
  # while the name is not empty, repeat this code
  while !student.empty? do
    # add the student hash to the array
    @students << process_user_input(student)
    puts "Now we have #{@students.length} students"
    # get another name from the user
    student = gets.delete("\n")
  end
end

MONTHS = ['january','february','march','april','may','june','july','august','september','october','november','december']

def process_user_input str
  raise 'please enter name and cohort comma separated, e.g. John, november' unless str.include? ','
  name, cohort = str.split(',').map{|s| s.strip}
  cohort = 'november' if cohort.empty? or !MONTHS.include? cohort.downcase
  name = 'John' if name.empty?
  {:name => name, :cohort => cohort.downcase.to_sym, :nationality => 'US'}
end


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
student = process_user_input 'Bert, November'
raise 'failed to downcase cohort' unless student == {:name => 'Bert', :cohort => :november, :nationality => 'US'}
begin  
  student = process_user_input '32ewdqrq3w'
  raise 'failed to throw comma exception'
rescue Exception => e
  raise 'failed missing comma' unless e.to_s == "please enter name and cohort comma separated, e.g. John, november"
end

def print_menu 
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end


# nothing happens until we call the methods
#students = input_students
# print_header
# print(students)
# print_footer(students)
interactive_menu
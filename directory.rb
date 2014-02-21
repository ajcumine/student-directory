@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)    
  end
end


def input_students
  puts "Please enter the names of the students and their cohort".center(200)
  puts "To finish, just hit return twice".center(200)
  print "Student name: "
  #get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #get the student cohort
    print "Student cohort: "
    cohort = STDIN.gets.chomp.downcase
    #add default cohort
    if cohort.empty?
      cohort = "default"
    end
    # add the student hash to the array
    add_student(name, cohort)
    puts "Now we have #{@students.length} students"
    # get another name from the user
    print "Student name: "
    name = STDIN.gets.chomp
  end
  #return the array of students
  @students
end


def print_header
  puts "The students of my cohort at Makers Academy".center(200)
  puts "-------------".center(200)
end


def print_students_list
  if @students.length == 0
    puts "There are no students".center(200)
  else
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(200)
    end
  end
end


def print_footer
  if @students.length == 1
    puts "Overall, we have 1 great student".center(200)
  else
    puts "Overall, we have #{@students.length} great students".center(200)
  end
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to student.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we will be adding more items
end


def show_students
  print_header
  print_students_list
  print_footer
end


def process(selection)
  case selection
  when "1"
    @students = input_students # input the students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will terminate the program
  else
    puts "I don't know what you meant, please try again"
  end
end


def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
end

def add_student(name, cohort)
  @students << {:name => name, :cohort => cohort.to_sym}
end


def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? #get out of method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.length} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

try_load_students
interactive_menu
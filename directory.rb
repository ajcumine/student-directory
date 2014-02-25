require 'csv'
@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu # 1. print the menu and ask the user what to do
    process(STDIN.gets.chomp) # 2. read the input and save it into a variable  
  end
end


def input_students
  puts "Please enter the names of the students".center(200)
  puts "To finish, just hit return twice".center(200)
  name = STDIN.gets.chomp #get the first name
  while !name.empty? do # while the name is not empty, repeat this code
    add_student(name, :february) # add the student hash to the array
    puts "Now we have #{@students.length} students"
    name = STDIN.gets.chomp # get another name from the user
  end
  @students #return the array of students
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
  CSV.open("students.csv", "w") do |file|# open file for writing
    @students.each do |student| # iterate over the array of students
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
end


def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    name, cohort = line
    add_student(name, cohort)
  end
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
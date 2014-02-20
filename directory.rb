# let's put all student's into an array
=begin
students = [
   {:name => "Mario Gintili", :cohort => :february},
   {:name => "Mikhail Dubov", :cohort => :february},
   {:name => "Karolis Noreika", :cohort => :february},
   {:name => "Michael Sidon", :cohort => :february},
   {:name => "Charles De Barros", :cohort => :february},
   {:name => "Ruslan Vikhor", :cohort => :february},
   {:name => "Toby Retallick", :cohort => :february},
   {:name => "Mark Mekhaiel", :cohort => :february},
   {:name => "Sarah Young", :cohort => :february},
   {:name => "Hannah Wight", :cohort => :february},
   {:name => "Khushkaran Singh", :cohort => :february},
   {:name => "Rick brunstedt", :cohort => :february},
   {:name => "Manjit Singh", :cohort => :february},
   {:name => "Alex Gaudiosi", :cohort => :february},
   {:name => "Ross Hepburn", :cohort => :february},
   {:name => "Natascia Marchese", :cohort => :february},
   {:name => "Tiffanie Chia", :cohort => :february},
   {:name => "Matthew Thomas", :cohort => :february},
   {:name => "Freddy McGroarty", :cohort => :february},
   {:name => "Tyler Rollins", :cohort => :february},
   {:name => "Richard Curteis", :cohort => :february},
   {:name => "Anna Yanova", :cohort => :february},
   {:name => "Andrew Cumine",:cohort => :february}
]
=end


def input_students
  puts "Please enter the names of the students and their cohort".center(200)
  puts "To finish, just hit return twice".center(200)
  #create an empty array
  students = []
  print "Student name: "
  #get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #get the student cohort
    print "Student cohort: "
    month = gets.chomp.downcase.to_sym
    #add default month
    if month.empty?
      month = "default"
    end
    # add the student hash to the array
    students << {:name => name, :cohort => month}
    puts "Now we have #{students.length} students"
    # get another name from the user
    print "Student name: "
    name = gets.chomp
  end
  #return the array of students
  students
end



def print_header
  puts "The students of my cohort at Makers Academy".center(200)
  puts "-------------".center(200)
end



def print_students(students)
  if students.length == 0
    puts "There are no students".center(200)
  else
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(200)
    end
  end
end


def print_students_by_cohort(students)
  puts "-------------".center(200)
  puts "The students sorted by cohort".center(200)
  sorted = students.sort {|a,b| a[:cohort] <=> b[:cohort]} #sort by cohort
  sorted.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(200)
  end
end


=begin
def print(students)
  i = 0
  while i < students.length
    student = students[i]
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(200)
    i += 1
  end
end
=end


def print_footer(names)
  if names.length == 1
    puts "Overall, we have 1 great student".center(200)
  else
    puts "Overall, we have #{names.length} great students".center(200)
  end
end

students = input_students
print_header
print_students(students)
print_students_by_cohort(students)
print_footer(students)

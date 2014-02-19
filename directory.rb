# let's put all student's into an array
students = [
   "Mario Gintili",
   "Mikhail Dubov",
   "Karolis Noreika",
   "Michael Sidon",
   "Charles De Barros",
   "Ruslan Vikhor",
   "Toby Retallick",
   "Mark Mekhaiel",
   "Sarah Young",
   "Hannah Wight",
   "Khushkaran Singh",
   "Rick brunstedt",
   "Manjit Singh",
   "Alex Gaudiosi",
   "Ross Hepburn",
   "Natascia Marchese",
   "Tiffanie Chia",
   "Matthew Thomas",
   "Freddy McGroarty",
   "Tyler Rollins",
   "Richard Curteis",
   "Anna Yanova",
   "Andrew Cumine"
]


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
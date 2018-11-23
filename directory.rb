#Student Array:
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

#Student List:
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |student|
    puts student
  end
end

#Student Count:
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

#Method Calls:
print_header
print(students)
print_footer(students)

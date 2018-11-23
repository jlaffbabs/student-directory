#Student Array:
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

#Student List:
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each_with_index do |student, index|
    puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#Student Count:
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

#Method Calls:
students = input_students
print_header
print(students)
print_footer(students)

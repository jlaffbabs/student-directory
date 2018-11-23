#Student Array:
def input_students
  puts "Please enter the name, then height then nationality of each student".center(70)
  puts "To finish, just hit return three times".center(70)
  students = []
  name = gets.chomp
  height = gets.chomp
  nation = gets.chomp
  while !name.empty? || !height.empty? || !nation.empty? do
    students << {name: name, cohort: :november, height: height, nation: nation}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    height = gets.chomp
    nation = gets.chomp
  end
  students
end

#Student List:
def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print(names)
  count = 0
  while count < names.length
    puts "#{names[count][:name]} (#{names[count][:cohort]} cohort) #{names[count][:nation]}: #{names[count][:height]}".center(70)
    count += 1
  end
end

#Student Count:
def print_footer(names)
  puts "Overall we have #{names.count} great students".center(70)
end

#Method Calls:
students = input_students
print_header
print(students)
print_footer(students)

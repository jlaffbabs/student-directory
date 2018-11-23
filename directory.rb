#Student Array:
def input_students
  puts "Please enter the name, then cohort, height and then nationality of each student".center(70)
  puts "To finish, just hit return four times".center(70)
  students = []
  name = gets.chomp
  cohort = gets.chomp
  height = gets.chomp
  nation = gets.chomp
  while !name.empty? do
    cohort = "n/a" if cohort.empty?
    height = "n/a" if height.empty?
    nation = "n/a" if nation.empty?
    students << {name: name, cohort: cohort, height: height, nation: nation}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp
    cohort = gets.chomp
    height = gets.chomp
    nation = gets.chomp
  end
  puts "Would you like to edit any students? Y/N"
  edit = gets.chomp.upcase
    while edit == "Y"
      puts students
      puts "Which student?"
      stud_edit = gets.chomp
      students.each do |student|
        if student[:name] == stud_edit
          puts "What would you like to edit? (name/cohort/height/nation)"
          cat_edit = gets.chomp
          if cat_edit == "name"
            puts "Enter your edit"
            student[:name] = gets.chomp
          elsif cat_edit == "cohort"
            puts "Enter your edit"
            student[:cohort] = gets.chomp
          elsif cat_edit == "height"
            puts "Enter your edit"
            student[:height] = gets.chomp
          elsif cat_edit == "nation"
            puts "Enter your edit"
            student[:nation] == gets.chomp
          end
        end
      end
      puts "Would you like to edit again? Y/N"
      edit = gets.chomp.upcase
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

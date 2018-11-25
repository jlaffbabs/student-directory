#Student Array:
def input_students
  puts "Please enter the name, then cohort, height and then nationality of each student".center(70)
  puts "To finish, just hit return four times".center(70)
  students = []
  name = gets.chomp
  cohort = gets.tr("\r\n", "")
  height = gets.tr("\r\n", "")
  nation = gets.tr("\r\n", "")
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
    name = gets.tr("\r\n", "")
    cohort = gets.tr("\r\n", "")
    height = gets.tr("\r\n", "")
    nation = gets.tr("\r\n", "")
  end
  puts "Would you like to edit any students? Y/N"
  edit = gets.tr("\r\n", "").upcase
  while edit == "Y"
    puts students
    puts "Which student?"
    stud_edit = gets.tr("\r\n", "")
    students.each do |student|
      if student[:name] == stud_edit
        puts "What would you like to edit? (name/cohort/height/nation)"
        cat_edit = gets.chomp
        if cat_edit == "name"
          puts "Enter your edit"
          student[:name] = gets.tr("\r\n", "")
        elsif cat_edit == "cohort"
          puts "Enter your edit"
          student[:cohort] = gets.tr("\r\n", "")
        elsif cat_edit == "height"
          puts "Enter your edit"
          student[:height] = gets.tr("\r\n", "")
        elsif cat_edit == "nation"
          puts "Enter your edit"
          student[:nation] == gets.tr("\r\n", "")
        end
      end
    end
    puts "Would you like to edit again? Y/N"
    edit = gets.tr("\r\n", "").upcase
  end
  students
end

def cohort_sort(students)
  sorted_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    height = student[:height]
    nation = student[:nation]

    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = []
    end
    sorted_by_cohort[cohort].push("#{name}, Height: #{height}, Nationality: #{nation}")
  end
  sorted_by_cohort
end

#Student List:
def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print(names)
  names.each do |cohort|
    puts cohort
  end
end

#Student Count:
def print_footer(names)
  puts "Overall we have #{names.count} great students".center(70)
end

#Method Calls:
students = input_students
coh = cohort_sort(students)
print_header
print(coh)
print_footer(students)

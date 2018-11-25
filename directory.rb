#Student Array:
@students = []
def input_students
  puts "Please enter the name, then cohort, height and then nationality of each student".center(70)
  puts "To finish, just hit return four times".center(70)
  name = gets.chomp
  cohort = gets.tr("\r\n", "")
  height = gets.tr("\r\n", "")
  nation = gets.tr("\r\n", "")
  while !name.empty? do
    cohort = "n/a" if cohort.empty?
    height = "n/a" if height.empty?
    nation = "n/a" if nation.empty?
    @students << {name: name, cohort: cohort, height: height, nation: nation}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = gets.tr("\r\n", "")
    cohort = gets.tr("\r\n", "")
    height = gets.tr("\r\n", "")
    nation = gets.tr("\r\n", "")
  end
end

#Student List:
def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print_students_list
  if @students.count == 0
    puts "Villans Academy is currently empty".center(70)
  else
    @students.each do |cohort|
      puts cohort
    end
  end
end

#Student Count:
def print_footer
  if @students.count > 0
    puts "Overall we have #{@students.count} great students".center(70)
  end
end

#Interactive Menu:
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:height], student[:nation]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort, height, nation = line.chomp.split(",")
    @students << {name: name, cohort: cohort, height: height, nation: nation}
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

#Method Calls:
interactive_menu

#Student Array:
@students = []
@students_filename = "students.csv"

def input_students
  puts "Please enter the name, then cohort, height and then nationality of each student".center(70)
  puts "To finish, just hit return four times".center(70)
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  height = STDIN.gets.chomp
  nation = STDIN.gets.chomp
  while !name.empty? do
    cohort = "n/a" if cohort.empty?
    height = "n/a" if height.empty?
    nation = "n/a" if nation.empty?
    sorting_student_array(name, cohort, height, nation)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
    height = STDIN.gets.chomp
    nation = STDIN.gets.chomp
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
  puts "3. Save the list to:"
  puts "4. Load the list from:"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  choose_file
  @filename = open(@filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:height], student[:nation]]
    csv_line = student_data.join(",")
    @filename.puts csv_line
  end
end

def choose_file
  @filename = STDIN.gets.chomp
  if @filename == ""
    @filename = "students.csv"
  end
end

def load_students (*)
  puts "Which file would you like to load? Default to students.csv"
  choose_file
  @filename = open(@filename)
  @filename.readlines.each do |line|
    name, cohort, height, nation = line.chomp.split(",")
    sorting_student_array(name, cohort, height, nation)
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = @students_filename
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def sorting_student_array(name, cohort, height, nation)
  @students << {name: name, cohort: cohort, height: height, nation: nation}
end

def action_success
  puts "Action was completed successfully."
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
  action_success
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


#Method Calls:
try_load_students
interactive_menu

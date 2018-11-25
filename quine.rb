def quine
  File.open($0, "r") {|this_file| this_file.readlines.each{|line| puts line}}
end
 quine

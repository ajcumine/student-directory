line_num = 0
File.open(File.basename(__FILE__), "r").each do |line|
  puts "#{line_num += 1} #{line}"
end
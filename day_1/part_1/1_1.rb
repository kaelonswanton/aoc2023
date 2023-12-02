def join_letters(code)
  new_code = code.chars.select { |c| c >= '0' && c <= '9' }.join
  if new_code.length == 1 
    new_code = new_code + new_code
  else
    new_code[0] + new_code[-1]
  end
end
codes = File.readlines('1_1.txt')
puts sum = codes.map { | code| join_letters(code).to_i }.sum

codes = File.readlines('1_1.txt')

word_to_digit = {
  "one" => '1',
  "two" => '2',
  "three" => '3',
  "four" => '4',
  "five" => '5',
  "six" => '6',
  "seven" => '7',
  "eight" => '8',
  "nine" => '9',
  '1' => '1',
  '2' => '2',
  '3' => '3',
  '4' => '4',
  '5' => '5',
  '6' => '6',
  '7' => '7',
  '8' => '8',
  '9' => '9',
  '0' => '0'
}


result = codes.each.map do |code|
  digits = code.match(/(\d|one|two|three|four|five|six|seven|eight|nine)/)
  first = word_to_digit[digits[0]]


  reverse_digits = code.reverse.match(/(\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)/)
  last = word_to_digit[reverse_digits[0].reverse]

  (first + last).to_i
end

total_sum = result.reduce(:+)
puts total_sum

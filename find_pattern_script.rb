require_relative "smallest_repeating_pattern"
require 'pry'
strings = [
  "ababababab",
  "accaccaccacc",
  "1233211233211",
  "0001000100",
  "1234567",
  "ababdbabb",
  "ababcabab",
  "1232123",
  "aaaabaa"
]
ARGV.each do |input|
  puts SmallestRepeatingPattern.find(input)
end

# strings.each do |string|
#   puts SmallestRepeatingPattern.find(string)
# end

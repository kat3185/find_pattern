# The problem:
# Write a program that finds the shortest repeating pattern in an input string.
# The input string will contain one or more complete copies of the pattern,
# possibly followed by a truncated copy.

class SmallestRepeatingPattern
  attr_reader :string

  def initialize(string)
    raise ArgumentError, "Argument is not a string" unless string.is_a? String
    @string = string
  end

  def find
    possible_string_lengths.each do |i|
      return string[0...i] if segments_match?(i)
    end
    string
  end

  def self.find(string)
    new(string).find
  end

  private

  def possible_string_lengths
    (1..max_length)
  end

  def max_length
    @max_length ||= string.length
  end

  def segments_match?(i)
    substrings = split_string_into_pieces_of_length(i)
    last_substring = substrings.pop

    relevant_segment = first_substring_segment(substrings, last_substring)

    substrings.uniq.length == 1 && last_substring == relevant_segment
  end

  def split_string_into_pieces_of_length(i)
    string.scan(/.{1,#{Regexp.quote(i.to_s)}}/)
  end

  def first_substring_segment(substrings, last_substring)
    if substrings.length > 0
      substrings.first[0...last_substring.length]
    else
      ""
    end
  end
end

ARGV.each do |input|
  puts SmallestRepeatingPattern.find(input)
end

examples = [
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

puts "\nAnswers match for examples:"

examples.each do |string|
  puts SmallestRepeatingPattern.find(string)
end

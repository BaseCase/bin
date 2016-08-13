#!/usr/bin/env ruby


class WordFrequencyCounter
  DELIMITERS = [
    " ",
    "\n",
    "<",
    ">",
    ".",
    "?",
    "!",
    ",",
    ";",
    ":",
    "—",
    "(",
    ")",
    "{",
    "}",
    "@",
  ]

  def initialize(input_string)
    @input = input_string
    @counts = Hash.new(0)
  end

  def count
    tokenized.map(&:downcase).each do |word|
      @counts[word] += 1
    end
    @counts
  end

  private

  def tokenized
    inside_tag = false
    current_word = []
    words = []

    @input.each_char do |c|
      if DELIMITERS.include? c
        if c == '<' then inside_tag = true end
        if c == '>' then inside_tag = false end

        if !inside_tag && !current_word.empty?
          words << current_word.join
          current_word.clear
        end
      else
        if !inside_tag
          current_word << c
        end
      end
    end

    words
  end
end


if __FILE__ == $0
  input = ARGF.read
  counter = WordFrequencyCounter.new(input)
  wordcounts = counter.count
  wordcounts.each do |k,v|
    $stdout.write "#{v} #{k}\n"
  end
end

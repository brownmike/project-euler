# Number letter counts
# Problem 17

# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred
# and forty-two) contains 23 letters and 115 (one hundred and fifteen)
# contains 20 letters. The use of "and" when writing out numbers is in
# compliance with British usage.

def number_word_char_count
  (1..1000).map(&:english_word).join.count_chars
end

class String
  def count_chars
    self.gsub(/\s+/, '').length
  end
end

class Fixnum
  def english_word
    if self <= 20
      number_words[self].capitalize
    else
      num_str = self.to_s.split('')
      case num_str.length
      when 2 # digits
        tens = number_words[(num_str.first + '0').to_i].capitalize
        ones = ''
        if num_str.last != '0'
          ones = ' ' + number_words[num_str.last.to_i].capitalize
        end
        tens + ones
      when 3 # digits
        hundreds = number_words[num_str.first.to_i].capitalize + ' Hundred'
        tens = ''
        ones = ''

        # 20 & above
        if num_str[1].to_i > 1
          tens = number_words[(num_str[1] + '0').to_i].capitalize + ' '
          if num_str.last != '0'
            ones = number_words[num_str.last.to_i].capitalize
          end
        end

        # teens
        if num_str[1] == '1'
          ones = number_words[num_str[1,2].join.to_i].capitalize
        end

        # no tens, just ones
        if num_str[1] == '0' && num_str.last != '0'
          ones = number_words[num_str.last.to_i].capitalize
        end

        if num_str[1,2] == %w[0 0]
          hundreds
        else
          hundreds + ' and ' + tens + ones
        end
      when 4
        'One Thousand'
      end
    end
  end

  private
    def number_words
      {
        0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
        5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
        10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen',
        14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen',
        18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty', 30 => 'thirty',
        40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy',
        80 => 'eighty', 90 => 'ninety'
      }
    end
end

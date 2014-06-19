# XOR decryption
# Problem 59

# Each character on a computer is assigned a unique code and the preferred
# standard is ASCII (American Standard Code for Information Interchange). For
# example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

# A modern encryption method is to take a text file, convert the bytes to
# ASCII, then XOR each byte with a given value, taken from a secret key. The
# advantage with the XOR function is that using the same encryption key on
# the cipher text, restores the plain text; for example, 65 XOR 42 = 107,
# then 107 XOR 42 = 65.

# For unbreakable encryption, the key is the same length as the plain text
# message, and the key is made up of random bytes. The user would keep the
# encrypted message and the encryption key in different locations, and
# without both "halves", it is impossible to decrypt the message.

# Unfortunately, this method is impractical for most users, so the modified
# method is to use a password as a key. If the password is shorter than the
# message, which is likely, the key is repeated cyclically throughout the
# message. The balance for this method is using a sufficiently long password
# key for security, but short enough to be memorable.

# Your task has been made easy, as the encryption key consists of three
# lower case characters. Using cipher1.txt, a file containing the encrypted
# ASCII codes, and the knowledge that the plain text must contain common
# English words, decrypt the message and find the sum of the ASCII values
# in the original text.

require 'benchmark'

class Euler59
  class << self
    def solve
      # a to z is 97 to 122 in ascii
      keys = ((97..122).to_a * 3).combination(3).to_a
      cipher = File.read('cipher1.txt').split(',').map(&:to_i)

      # common english words from wikipedia with > 2 chars
      common_words = %w[the and that have for not with you this but from they]

      keys.each do |key|
        candidate = decrypt(cipher,key)
        word_count = 0
        common_words.each do |word|
          word_count += 1 if candidate.include?(word)
          if word_count >= 3
            puts candidate
            return candidate.chars.map(&:ord).inject(:+)
          end
        end
      end
    end

    def decrypt(msg, key)
      length = key.length
      msg.each_with_index.map { |c,i| c ^ key[i % length] }.map(&:chr).join
    end
  end
end

p Benchmark.measure { puts Euler59.solve }

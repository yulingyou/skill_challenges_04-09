def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # p key.chars.uniq
  # p ('a'...'z').to_a
  # exit
  ciphertext_chars = plaintext.chars.map do |char|
    # p "cipher.find_index(char)):"
    # p cipher.find_index(char)
    # p char
    # p cipher
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[(65 - char.ord).abs]
    # p char
    # p char.ord
    # p cipher
    # out_char = cipher[65 - char.ord]
    # p "Should be t"
    # p "Actually is #{out_char}"
    # exit
  end
  return plaintext_chars.join
end

p encode("theswiftfoxjumpedoverthelazydog", "secretkey")
p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    if char != " " && char != ","
    counter[char] += 1
    # p char
    end
  end
  counter.to_a.sort_by { |k, v| v }[-1][0]
  # p counter.to_a
  # p counter.to_a.sort_by { |k, v| v }[-1][0]
end

p get_most_common_letter("the roof, the roof, the roof is on fire!")
# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
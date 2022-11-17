class DiaryReader
  def initialize(wpm,diary)
  #wpm is how many words the user can read in a minute
  #diary is an instance of Diary
    @wpm = wpm
    @diary = diary
  end

  def find_most_readable_in_time(time)
  # Returns an instance of DiaryEntry, corresponding to the longest readable content within the given time and wpm
    fail "should give more than 0 minutes" if time <= 0
    readable = @diary.entries.select do |entry|
      reading_time(entry) <= time
    end
    readable.max_by do |entry|
      count_words(entry)
    end
  end

  private 

  def reading_time(entry)
    (count_words(entry) / @wpm.to_f).ceil
  end

  def count_words(entry)
    entry.contents.split(" ").length
  end
end
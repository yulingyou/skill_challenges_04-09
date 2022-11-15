class Diary
  def initialize
      @my_diary = []
      @totalWords = 0
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    @my_diary.push(entry)
  end

  def all
    # Returns a list of instances of DiaryEntry
    return @my_diary
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    
    @my_diary.each do |entry|
      @totalWords += entry.count_words
    end
    @totalWords
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    ((@totalWords.to_f / wpm.to_f)).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable_entries = @my_diary.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
      readable_entries.max { |a, b| a.count_words <=> b.count_words }
  end
end
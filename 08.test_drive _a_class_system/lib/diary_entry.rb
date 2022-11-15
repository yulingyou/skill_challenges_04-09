class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  #   @start = 0
  #   @finish = 0
    @furthestwordread = 0
  end

  def title
    # Returns the title as a string
    @title
  end

  def contents
    # Returns the contents as a string
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split(' ').length
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    fail "wpm must be positive." unless wpm.positive?
     ((@contents.split(' ').length.to_f / wpm.to_f).ceil).to_i
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  #   @finish += wpm * minutes

  #   var = @contents.split(' ')[@start,@finish].join(' ') 
  #   if (@finish >= (@contents.split(' ').size))
  #     @start = 0
  #     @finish = 0
  #   else
  #     @start = @finish 
  #   end
  #   return var 
  words_in_contents = @contents.split(" ")
  words_read = wpm * minutes # wpm (50) * minutes (2) = 100 words

  begin_at = @furthestwordread
  end_at = words_read + begin_at
  @furthestwordread = end_at
  if end_at >= count_words
    @furthestwordread = 0
  end
  words_in_contents[begin_at...end_at].join(" ")
  
  end
end
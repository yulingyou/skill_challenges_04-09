class Diary
  def initialize
    @diary = []
  end

  def add(entry) #entry is an instance of DiaryEntry
    @diary << entry
  end

  def entries
    # Returns a list of all added entries
    @diary
  end

end
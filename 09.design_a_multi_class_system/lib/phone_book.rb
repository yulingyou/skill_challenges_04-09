class PhoneBook
  def initialize(diary) #diary is an instance of Diary
    @diary = diary
  end

  def extract_numbers
    @diary.entries.flat_map do |entry|
    entry.contents.scan(/07[0-9]{9}/)
    end.uniq
  end
end

class PhoneBook
  def initialize(diary) #diary is an instance of Diary
    @diary = diary
  end

  def extract_numbers
    @diary.entries.map do |entry|
    entry.contents.match(/[0-9]{11}/).to_s
    end
  end
end

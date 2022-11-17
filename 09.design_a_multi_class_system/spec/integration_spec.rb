require 'diary'
require 'diary_entry'
require 'phone_book'
require 'diary_reader'

RSpec.describe "integration" do
  context "constructs a diary" do
    it "should return a diary_entry after add one entry" do
      my_diary = Diary.new
      diary_entry = DiaryEntry.new("my title", "my contents")
      my_diary.add(diary_entry)
      expect(my_diary.entries).to eq [diary_entry]
    end

    it "should return two entries after add two entries" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title", "my contents")
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      expect(my_diary.entries).to eq [diary_entry_1,diary_entry_2]
    end

    it "should return one phone number after a single phone number add in" do
      my_diary = Diary.new
      diary_entry = DiaryEntry.new("Bob", "07123123123")
      my_diary.add(diary_entry)
      phone_book = PhoneBook.new(my_diary)
      expect(phone_book.extract_numbers).to eq ["07123123123"]
    end

    it "should return two phone number after two phone number add in" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Bob", "07123123123")
      diary_entry_2 = DiaryEntry.new("Bill", "blabla 07234234234 blabla")
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      phone_book = PhoneBook.new(my_diary)
      expect(phone_book.extract_numbers).to eq ["07123123123","07234234234"]
    end

    it "should return empty if no phone number match" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Bob", "07123123")
      diary_entry_2 = DiaryEntry.new("Bill", "blabla 77234234234 blabla")
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      phone_book = PhoneBook.new(my_diary)
      expect(phone_book.extract_numbers).to eq []
    end

    it "should return one phone number when there is one number match phone number and it's not repeat" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Bob", "07123123123")
      diary_entry_2 = DiaryEntry.new("Bill", "blabla 072342344 blabla")
      diary_entry_3 = DiaryEntry.new("Bob's number", "07123123123")
      diary_entry_4 = DiaryEntry.new("Bob's number", "17123123123")
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      my_diary.add(diary_entry_3)
      my_diary.add(diary_entry_4)
      phone_book = PhoneBook.new(my_diary)
      expect(phone_book.extract_numbers).to eq ["07123123123"]
    end

    it "should find most readable in time" do 
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Bob", "one two")
      diary_entry_2 = DiaryEntry.new("Bill", "one two three four")
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      diary_reader = DiaryReader.new(2, my_diary)
      result = diary_reader.find_most_readable_in_time(2)
      expect(result).to eq diary_entry_2
    end

    context "should fail if readable is 0" do
      it "fail" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Bob", "one two")
      my_diary.add(diary_entry_1)
      diary_reader = DiaryReader.new(2, my_diary)
      expect{diary_reader.find_most_readable_in_time(0)}.to raise_error "should give more than 0 minutes"
      end
    end
  end
end

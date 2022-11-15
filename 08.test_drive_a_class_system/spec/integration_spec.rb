require "diary"
require "diary_entry"

RSpec.describe "Diary and diary entry integration" do
    it "Creates a new diary and can add new entries to the diary" do
        myDiary = Diary.new
        entryOne = DiaryEntry.new("one","This is my first diary entry." )
        entryTwo = DiaryEntry.new("two","This is my second diary entry." )
        myDiary.add(entryOne)
        myDiary.add(entryTwo)
        expect(myDiary.all).to eq [entryOne,entryTwo]
    end

    it "Iterates through all diary entries and returns the number of words" do
        myDiary = Diary.new
        entryOne = DiaryEntry.new("one","This is my first diary entry." )
        entryTwo = DiaryEntry.new("two","This is my second diary entry." )
        myDiary.add(entryOne)
        myDiary.add(entryTwo)
        expect(myDiary.count_words).to eq 12
    end

    it "Iterates through all diary entries and tells you how long it would take to read all content" do
        myDiary = Diary.new
        entryOne = DiaryEntry.new("one","This is my first diary entry." )
        entryTwo = DiaryEntry.new("two","This is my second diary entry." )
        myDiary.add(entryOne)
        myDiary.add(entryTwo)
        myDiary.count_words
        expect(myDiary.reading_time(3)).to eq 4
    end

    context "where we just have one entry and it is readable in the time" do
      it "returns that entry" do
        myDiary = Diary.new
        entryOne = DiaryEntry.new("one","my contents." )
        myDiary.add(entryOne)
        result = myDiary.find_best_entry_for_reading_time(2,1)
        expect(result).to eq entryOne
      end
    end

    context "where we just have one entry and it is unreadable in the time" do
      it "returns nil" do
        myDiary = Diary.new
        entryOne = DiaryEntry.new("one","my contents longer." )
        myDiary.add(entryOne)
        result = myDiary.find_best_entry_for_reading_time(2,1)
        expect(result).to eq nil
      end
    end

    context "where we have multiple entries" do
      it "should return the longest readable entry based on wpm and minutes" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "my contents")
        diary_entry_2 = DiaryEntry.new("my title", "End of week one")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.find_best_entry_for_reading_time(5, 1)).to eq diary_entry_2
      end
    end
end
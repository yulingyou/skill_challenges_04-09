require "diary_entry"

RSpec.describe DiaryEntry do
    it "Creates a diary entry and can return title" do
    input = DiaryEntry.new("One", "This is my first time.")
    expect(input.title).to eq("One")
    end

    it "Creates a diary entry and can return content" do
        input = DiaryEntry.new("One", "This is my first time.")
        expect(input.contents).to eq("This is my first time.")
    end

    it "returns the number of words in the example" do
        input = DiaryEntry.new("One", "This is my first time.")
        expect(input.count_words).to eq(5)
    end

    it "returns the estimated time to read the entry" do
        input = DiaryEntry.new("One", "This is my first time.")
        expect(input.reading_time(1)).to eq(5)
    end

    it "returns the estimated time to read the entry" do
        input = DiaryEntry.new("One", "This is my first time.")
        expect(input.reading_time(2)).to eq(3)
    end

    it "fails where wpm is 0" do
      input = DiaryEntry.new("One", "This is my first time.")
      expect{input.reading_time(0)}.to raise_error("wpm must be positive.")
  end

    it "reading_chunk returns entire small string" do
        input = DiaryEntry.new("One", "This is my first time.")
        expect(input.reading_chunk(5,1)).to eq "This is my first time."
    end

    it "reading_chunk returns entire partial string on slightly longer content" do
        input = DiaryEntry.new("One", "This is my first time. This is my first time.")
        expect(input.reading_chunk(5,2)).to eq "This is my first time. This is my first time." 
    end

    it "reading_chunk returns entire partial string on longer content" do
        input = DiaryEntry.new("One", "This is my first time." * 3)
        expect(input.reading_chunk(5,3)).to eq "This is my first time." *2 + "This is my first time." 
    end

    it "reading_chunk returns entire partial string on longer content" do
        input = DiaryEntry.new("One", "This is my first time. " * 100)
        expect(input.reading_chunk(50,2)).to eq ("This is my first time. " * 19) + "This is my first time."
    end

    it "reading_chunk returns 2nd portion of reading content" do
        input = DiaryEntry.new("One", "This is my first time.")
        input.reading_chunk(1,2)
        result = input.reading_chunk(1,2)
        expect(result).to eq "my first"
    end

    it "restarts back at the beginning after reading all content" do
        input = DiaryEntry.new("One", "This is my first time. ")
        input.reading_chunk(1,5)
        result = input.reading_chunk(1,2)
        expect(result).to eq "This is"
    end

end
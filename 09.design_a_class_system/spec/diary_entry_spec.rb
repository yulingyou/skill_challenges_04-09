require 'diary_entry'

RSpec.describe DiaryEntry do
  it "should return my title" do 
    diary_entry = DiaryEntry.new("my title", "my contents")
    expect(diary_entry.title).to eq "my title"
  end

  it "should return my contents" do 
    diary_entry = DiaryEntry.new("my title", "my contents")
    expect(diary_entry.contents).to eq "my contents"
  end
end
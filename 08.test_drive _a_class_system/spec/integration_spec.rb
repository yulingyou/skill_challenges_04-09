require 'diary'
require 'diary_entry'

RSpec.describe "integration" do
  context "after adding some entries"
  it "return a list of instances of DiaryEntry" do
    diary_list = Diary.new
    diary_entry = DiaryEntry.new("my title", "my contents")
    diary_list.add(diary_entry)
    expect(diary_list.all).to eq [diary_entry]
  end

end

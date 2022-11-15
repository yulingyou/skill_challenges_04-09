require 'diary'

RSpec.describe "diary" do
  context "initialize" do
    it "return empty list of entries" do 
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end
end


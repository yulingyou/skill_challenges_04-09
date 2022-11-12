require 'challenge'

RSpec.describe MusicList do
  
  it "should return empty array if no song added" do
    music_list = MusicList.new
    expect(music_list.list).to eq []
  end

  it "should return 1 song if song is added" do
    music_list = MusicList.new
    music_list.add("Happy Song")
    expect(music_list.list).to eq ["Happy Song"]
  end

  it "should return 2 songs if 2 songs are added" do
    music_list = MusicList.new
    music_list.add("Happy Song")
    music_list.add("Lazy Song")
    expect(music_list.list).to eq ["Happy Song", "Lazy Song"]
  end

end
require_relative '../lib/song.rb'
 
describe "Song" do 
  let (:checker) {Song.new("Life is Good", "Future")}

  it "returns title of song" do 
    expect(checker.title).to eq("Life is Good")
  end


end
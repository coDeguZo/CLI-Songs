User.destroy_all
Song.destroy_all
SongUser.destroy_all

# 10.times do 
#   User.create(name: Faker::Name.name)
# end

uzoma = User.create(name: "Uzoma")
chibu = User.create(name: "Chibu")
adamma = User.create(name: "Adamma")

song1 = Song.create(title: "The Box", artist: "Roddy Ricch")
song2 = Song.create(title: "Don't Start Now", artist: "Dua Lipa")
song3 = Song.create(title: "Life is Good", artist: "Future")
song4 = Song.create(title: "Blinding Lights", artist: "The Weeknd")
song5 = Song.create(title: "Circles", artist: "Post Malone")

# User.all.each do |user|
#   Song.all.each do |song|s
#     SongUser.create(user_id: user.id, song_id: song.id)
#   end
# end

3.times do
  SongUser.create(user_id: User.all.sample.id, song_id: Song.all.sample.id)
end


User.destroy_all
Song.destroy_all
SongUser.destroy_all

# 10.times do 
#   User.create(name: Faker::Name.name)
# end

uzoma = User.create(name: "Uzoma")
chibu = User.create(name: "Chibu")
adamma = User.create(name: "Adamma")

10.times do 
  Song.create(title: Faker::Music.album)
end

# User.all.each do |user|
#   Song.all.each do |song|s
#     SongUser.create(user_id: user.id, song_id: song.id)
#   end
# end

10.times do
  SongUser.create(user_id: User.all.sample.id, song_id: Song.all.sample.id)
end


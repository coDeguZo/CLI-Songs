class User < ActiveRecord::Base
  has_many :song_users
  has_many :songs, through: :song_users

  def display_songs
    puts "Your Discography"
    songs.each do |song|
      puts "Song Name: #{song.title}"
    end
  end

  def add_song
    puts "***************************"
    puts "Type Song to add to Library"
    puts "***************************"
    input = gets.chomp
    add = Song.all.find {|song| song.title == input}
    if add == nil 
      puts "Song Not found :(. Please return to the Main Menu"
    end
    song_user_create = SongUser.create(user_id: self.id, song_id: add.id)
    song_user_create.save
    puts "Song Added!"
  end

end
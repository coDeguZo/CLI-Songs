class User < ActiveRecord::Base
  has_many :song_users
  has_many :songs, through: :song_users

  def display_songs
    puts "Your Discography"
    songs.each do |song|
      puts "Song Name: #{song.title}"
    end
  end

end
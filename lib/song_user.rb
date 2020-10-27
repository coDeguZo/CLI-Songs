class SongUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  def self.all_time_popular_song
    songs = SongUser.all.map {|s| s.song_id}
    most_popular_song_id = songs.max_by {|x| songs.count(x)}
    most_popular_song = Song.all.find {|song| song.id == most_popular_song_id}
    puts "* Most Popular Song *"
    puts "Song: #{most_popular_song.title}"
  end

end
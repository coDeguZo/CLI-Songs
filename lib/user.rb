class User < ActiveRecord::Base
  has_many :song_users
  has_many :songs, through: :song_users

  # I can add a song to my library +
  # I can see all the songs in my library +
  # I can search for songs in my library by artist +
  # I can search for songs in my library by title
  # I can get the number of users who have added the song to their library (how popular the song is)
  # I can find the most popular song

  def display_songs
    puts "Your Discography"
    songs.each do |song|
      puts "* Artist: #{song.artist} - Song Name: #{song.title}"
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
    else
      song_user_create = SongUser.create(user_id: self.id, song_id: add.id)
      song_user_create.save
      puts "Song Added!"
    end
  end

  def search_songs_by_artist
    puts "***************************"
    puts "Type Artist Name"
    puts "***************************"
    input = gets.chomp
    artist = Song.all.find_all {|song| song.artist == input}
    if !artist
      puts "Artist Could Not Be Found"
    else
      puts "Artist: #{artist[0].artist}"
      puts "Songs:"
      artist.each do |a|
      puts "* #{a.title}"
      end
    end
  end

  def search_songs_by_title
    puts "***************************"
    puts "Type Song Name"
    puts "***************************"
    input = gets.chomp
    song = Song.all.find {|s| s.title == input}
    if !song
      puts "Song does not exist in library"
    else
      puts "Song: #{song.title} exist in libray!"
    end
  end

  def most_popular_song
    songs = self.songs.map do |s|
      s.title
    end
    song_hash = songs.inject(Hash.new(0)) {|h,v| h[v] += 1; h}
    popular_song = song_hash.max_by do |key|
      song_hash[key]
    end
    puts "* Popular Song *"
    puts "Song: #{popular_song.first}"
  end
  
end
class CommandLineInterface

# I can add a song to my library
# I can see all the songs in my library
# I can search for songs in my library by artist
# I can search for songs in my library by title
# I can get the number of users who have added the song to their library (how popular the song is)
# I can find the most popular song

  def welcome
    puts "Hello!  Please enter your name to sign-in :)"
  end

  def get_user
    input = gets.chomp.upcase
    user = User.all.find {|x| x.name.downcase == input.downcase}
    2.times {puts ""}
    puts "Welcome #{user.name}!"
    2.times {puts ""}
    user
  end

  def welcome_menu(user)
    puts "Please selection from the following options #{user.name}:"
    puts "1. See my Songs"
    puts "2. See My Name"
    puts "3. Exit"
    choice = gets.chomp
    case choice.to_i
      when 1
        user.display_songs
        return_to_menu(user)
    end
  end

  def return_to_menu(user)
    puts "Click any key to return to Menu"
    gets
    welcome_menu(user)
  end

  def run
    welcome
    user = get_user
    welcome_menu(user)
  end
end
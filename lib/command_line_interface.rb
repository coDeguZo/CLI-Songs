require "tty-prompt"

class CommandLineInterface
  def logo
    puts "*****************************************************************************"
    puts '           _________                   ___________                          
          /   _____/ ____   ____    ___\__    ___/_ __  ____   ____   ______
          \_____  \ /  _ \ /    \  / ___\|    | |  |  \/    \_/ __ \ /  ___/
          /        (  <_> )   |  \/ /_/  >    | |  |  /   |  \  ___/ \___ \ 
        /_______  /\____/|___|  /\___  /|____| |____/|___|  /\___  >____  >
                \/            \//_____/                   \/     \/     \/ '
    puts "*****************************************************************************"
  end

  def welcome
    puts "Hello!  Please enter your name to sign-in :)"
  end

  def get_user
    input = gets.chomp
    user = User.all.find {|x| x.name.downcase == input.downcase}
    # Refactor Later
    case user
      when nil
        puts "Please use a valid username. Please sign back on."
        exit
      when user
        2.times {puts ""}
        puts "Welcome #{user.name}!"
        2.times {puts ""}
        user
    end
  end

  def welcome_menu(user)
    system("clear")
    logo
    prompt = TTY::Prompt.new
    choices = [
      "See All Songs", 
      "See My Songs", 
      "Search By Artist", 
      "Search By Title",
      "My Most Popular Song",
      "All Time Most Popular Song",
      "Add Song to Library", 
      "Exit"
    ]
    choice = prompt.select("Select Item", choices)
    case choice
      when "See All Songs"
        Song.all.each do |song|
          puts "* Artist: #{song.artist} - Song: #{song.title}"
        end
        return_to_menu(user)
      when "See My Songs"
        user.display_songs
        return_to_menu(user)
      when "Search By Artist"
        user.search_songs_by_artist
        return_to_menu(user)
      when "Search By Title"
        user.search_songs_by_title
        return_to_menu(user)
      when "My Most Popular Song"
        user.most_popular_song
        return_to_menu(user)
      when "All Time Most Popular Song"
        SongUser.all_time_popular_song
        return_to_menu(user)
      when "Add Song to Library"
        user.add_song
        return_to_menu(user)
      when "Exit"
        puts "Come Back Soon!!"
        exit
    end
  end

  def return_to_menu(user)
    puts "Click any key to return to Menu"
    gets
    welcome_menu(user)
  end

  def run
    system("clear")
    logo
    welcome
    user = get_user
    welcome_menu(user)
  end
end


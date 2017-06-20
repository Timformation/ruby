require_relative("song")
require_relative("jukebox")

jukebox = Jukebox.new

songs_file = File.open("songs.txt", "r")
until songs_file.eof?
  line = songs_file.gets.chomp
  song_array = line.split("\t")
  new_song = Song.new(song_array[0], song_array[1], song_array[2], song_array[3], song_array[4], song_array[5])
  jukebox.add_song(new_song)
end
songs_file.close

user_selection = 0

def menu

  puts "1) Show all songs that are longer than (you enter the time):"
  puts "2) Show all songs that were written by (enter an artist's name):"
  puts "3) Play a specific song:"
  puts "4) Add a new song to the jukebox (you'll be asked for the song's information):"
  puts "5) Delete a song from the jukebox:"
  puts "6) Update a song in the jukebox:"
  puts "7) Show all songs in the jukebox:"
  puts "8) Exit the program."
end

until user_selection == 8

  menu
  user_selection = gets.chomp.to_i

  case user_selection

    when 1

      puts "Show all songs over what length (in seconds)?"
      song_length = gets.chomp.to_i
      list = jukebox.track_length(song_length)
      list.each do |song|
        puts song
        puts
      end

    when 2

      puts "Please enter an artist to search for: "
      artist_finder = gets.chomp
      artist = jukebox.artist_search(artist_finder)
      artist.each do |song|
        puts song
        puts
      end


    when 3
      puts "#{jukebox.list_of_songs}"
      puts "Enter the number of the song you want to play: "
      song_to_play = gets.chomp.to_i
      puts jukebox.play_song(song_to_play)

    when 4

      new_song_title = ""
      new_song_artist = ""
      new_song_album = ""
      new_song_year = 0
      new_song_comments = ""
      new_song_length = 0
      puts "Please enter the new song's TITLE:"
      new_song_title = gets.chomp
      puts "Please enter the new song's ARTIST:"
      new_song_artist = gets.chomp
      puts "Please enter the new song's ALBUM:"
      new_song_album = gets.chomp
      puts "Please enter the new song's YEAR:"
      new_song_year = gets.chomp.to_i
      puts "Please enter the new song's COMMENTS:"
      new_song_comments = gets.chomp
      puts "Please enter the new song's LENGTH (in seconds):"
      new_song_length = gets.chomp.to_i
      jukebox.add_song(Song.new(new_song_title, new_song_artist, new_song_album, new_song_year, new_song_comments, new_song_length))
      puts "The new song has been added to the jukebox.\n\n"

    when 5
      puts "#{jukebox.list_of_songs}"
      puts "\nEnter the number of the song you want to delete from the playlist:"
      kill_song = gets.chomp.to_i
      jukebox.delete_song(kill_song)


    when 6
      puts "#{jukebox.list_of_songs}"
      puts "Which song would you like to update?"
      song_to_update = gets.chomp
      jukebox.delete_song(song_to_update)

      update_song_title = ""
      update_song_artist = ""
      update_song_album = ""
      update_song_year = 0
      update_song_comments = ""
      update_song_length = 0
      puts "Please enter the song's new TITLE:"
      update_song_title = gets.chomp
      puts "Please enter the song's new ARTIST:"
      update_song_artist = gets.chomp
      puts "Please enter the song's new ALBUM:"
      update_song_album = gets.chomp
      puts "Please enter the song's new YEAR:"
      update_song_year = gets.chomp.to_i
      puts "Please enter the song's new COMMENTS:"
      update_song_comments = gets.chomp
      puts "Please enter the song's new LENGTH (in seconds):"
      update_song_length = gets.chomp.to_i
      jukebox.add_song(Song.new(update_song_title, update_song_artist, update_song_album, update_song_year, update_song_comments, update_song_length))
      puts "The song has been updated in the jukebox.\n\n"


    when 7

      puts "#{jukebox.list_of_songs}"

    when 8

      puts "\nOverwriting original playlist to include your changes and exiting program...\n" #TODO: Rewrite to songs.txt when program closes.

      revised_playlist = File.open("songs.txt", 'w+')
      jukebox.songs_for_saving.each do |song|
        revised_playlist.puts song.to_tabbed_data
      end
      revised_playlist.close
  end
end


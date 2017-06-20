class Jukebox
  attr_reader :new_song, :songs

  def initialize
    @songs = []
  end


  def track_length(length_over)
    song_times = []
    @songs.each do |song|
      if song.length.to_i > length_over
        song_times << song
      end
    end
    return song_times
  end


  def add_song(song)
    @songs << song
  end


  def update_song(song_to_update)
    @songs.each_with_index do |song, index|
      if (song.to_i - 1) == index.to_i
        @songs.delete_at(index)
      end
    end
  end


  def artist_search(artist_finder)
    artist_list = []
    @songs.each do |song|
      if song.artist == artist_finder
        artist_list << song
      end
    end
    return artist_list
  end


  def list_of_songs
    list_string = ""
    songs.each_with_index do |song, index|
      list_string += "#{index + 1}) #{song} \n\n"
    end
    return list_string
  end

  def delete_song(kill_song)
    @songs.each_with_index do |song, index|
      if (kill_song.to_i - 1) == index.to_i
        @songs.delete_at(index)
      end
    end
  end


  def play_song(song_to_play)
    play_a_song = ""
    @songs.each_with_index do |song, index|
      if (song_to_play - 1) == index.to_i
        play_a_song = "As \"#{song.title}\" begins to play, you can't help but dance... \n\n"
      end
    end
    return play_a_song #TODO: Ask dave why this only works here, and not one line up from here.
  end

  def songs_for_saving
    return @songs
  end
end


class Song
  attr_accessor :title, :artist, :album, :year, :comments, :length

  def initialize(title, artist, album, year, comments, length)
    @title = title
    @artist = artist
    @album = album
    @year = year
    @comments = comments
    @length = length

  end

  def to_s
    return "#{@title} by #{@artist}, from the album #{@album} is from the year #{@year}, and is #{@length} seconds long. These comments are attached: #{@comments}."
  end

  def to_tabbed_data
    return "#{@title}\t#{@artist}\t#{@album}\t#{@year}\t#{@comments}\t#{@length}"
  end

end


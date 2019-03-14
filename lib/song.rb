require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      song = self.find_by_name(song_name)
    else
      song = self.create_by_name(song_name)
    end
    song
  end

  def self.new_from_filename(song_info)
    info_array = song_info.split(" - ")
    song = self.new_by_name(info_array[1].chomp('.mp3'))
    song.artist_name = info_array[0]
    song
  end

  def self.create_from_filename(song_info)
    info_array = song_info.split(" - ")
    song = self.create_by_name(info_array[1].chomp('.mp3'))
    song.artist_name = info_array[0]
    song
  end


  def self.alphabetical
    self.all.sort_by do |song|
      song.name.downcase
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end

# song_1 = Song.create_by_name("Thriller")
# song_2 = Song.create_by_name("Blank Space")
# song_3 = Song.create_by_name("Call Me Maybe")

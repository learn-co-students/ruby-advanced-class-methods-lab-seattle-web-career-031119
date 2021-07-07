require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    #search through @@all using find
    found = self.all.detect {|song_list| song_list.name == song_name}
    found
  end

  def self.find_or_create_by_name(song_name)
    #determine if that song already exists.  If so, return it.  Otherwise create a new one and return it.
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else self.create_by_name(song_name)
    end

  end

  def self.alphabetical
    self.all.sort_by {|song| song.name.downcase}
  end

  def self.new_from_filename(song_file)
    song_list = song_file.split(" - ")
    song_list[1] = song_list[1].chomp(".mp3")
    song = Song.new
    song.name = song_list[1]
    song.artist_name = song_list[0]
    song
  end

  def self.create_from_filename(song_file)
    new_song = self.new_from_filename(song_file)
    song = self.create
    song.name = new_song.name
    song.artist_name = new_song.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end


end

require 'pry'

class Song
  attr_accessor :name, :artist_name, :song

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ").first
    song_name = filename.split(" - ").last.chomp('.mp3')

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end
  # binding.pry
  def self.create_from_filename(filename)
    artist_name = filename.split(" - ").first
    song_name = filename.split(" - ").last.chomp('.mp3')

    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

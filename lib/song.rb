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
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) == nil ? Song.create_by_name(name) : Song.find_by_name(name)
  end

  def self.alphabetical
    sorted_array = @@all.sort_by {|object| object.name}
    sorted_array
  end

  def self.new_from_filename(file)
    name_array = file.split(" - ")
    new_song = self.create_by_name(name_array[1][0...-4])
    new_song.artist_name = name_array[0]
    new_song
  end

  def self.create_from_filename(file)
    name_array = file.split(" - ")
    new_song = self.create_by_name(name_array[1][0...-4])
    new_song.artist_name = name_array[0]
    new_song
  end

  def self.destroy_all
    @@all = [ ]
  end

end

# Song.create_by_name("you mom")
# Song.create_by_name("your mam")
# Song.create_by_name("yar mum")
# pry.Start

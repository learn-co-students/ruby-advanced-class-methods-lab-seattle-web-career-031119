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
    song.save
    song
  end

  def self.new_by_name(name, artist_name = nil)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_by_name(name, artist_name = nil)
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.find_by_name(search_name)

    # the_song = false
    # self.all.each do |song|
    #   if song.name == search_name
    #     the_song = song
    #   end
    # end
    # the_song
    self.all.detect{|s| s.name == search_name}
  end

  def self.find_or_create_by_name(search_name)

    if self.find_by_name(search_name)
      self.find_by_name(search_name)
    else
      self.create_by_name(search_name)

    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    file_name.slice! ".mp3"
    dummy_array = file_name.split(' - ')
    name = dummy_array[1]
    artist_name = dummy_array[0]
    self.new_by_name(name, artist_name)
  end

  def self.create_from_filename(file_name)
    file_name.slice! ".mp3"
    dummy_array = file_name.split(' - ')
    name = dummy_array[1]
    artist_name = dummy_array[0]
    self.create_by_name(name, artist_name)
  end

  def self.destroy_all
    @@all.clear
  end
end

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
    instance = self.new
    self.all << instance
    instance
  end

  def self.new_by_name(song_name)
    instance = self.new
    instance.name = song_name
    instance
  end

  def self.create_by_name(song_name)
    instance = self.create
    instance.name = song_name
    instance
  end

  def self.find_by_name(song_name)
    self.all.find {|song|
      song.name == song_name
    }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ?
      self.find_by_name(song_name) :
      self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|object|
      object.name
    }
  end

  def self.new_from_filename(file_name)
    song_array = file_name.split(/\.|\s-\s/)[0..-2]
    instance = self.new
    instance.name = song_array[1]
    instance.artist_name = song_array[0]
    instance
  end

  def self.create_from_filename(file_name)
    song_array = file_name.split(/\.|\s-\s/)[0..-2]
    # Regex. means dot(backslashed out) or(the pipe symbol) whitespace hyphen whitespace (with both spaces backslashed out)
    instance = self.create
    instance.name = song_array[1]
    instance.artist_name = song_array[0]
    instance
  end

  def self.destroy_all
    self.all.clear
  end

end

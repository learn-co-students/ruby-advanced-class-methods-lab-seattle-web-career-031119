class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
   tune = Song.new
   tune.save
   tune
  end

  def self.new_by_name(name)
    tune = Song.new
    tune.name = name
    tune.save
    tune
  end

  def self.new_from_filename(file)
    path_parts = file.split(/[-.]/)
    song = Song.new
    song.artist_name = path_parts.first.strip
    song.name = path_parts[1].strip
    song.save
    song
  end

  def self.create_from_filename(file)
    path_parts = file.split(/[-.]/)
    song = Song.new
    song.artist_name = path_parts.first.strip
    song.name = path_parts[1].strip
    song.save
    song
  end

  def self.create_by_name(name)
    tune = Song.new
    tune.name = name
    tune.save
    tune
  end

  def self.find_by_name(name)
    self.all.find{|item| item.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    result.nil? ? self.create_by_name(name) : result
  end

  def self.alphabetical
    self.all.sort{|a, b|
      a.name <=> b.name
    }
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end

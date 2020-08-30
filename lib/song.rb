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
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find{ |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    find_result = find_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_result
    end
  end

  def self.alphabetical
    @@all.sort_by { |song|
      song.name
    }
  end

  def self.new_from_filename(filename)
    new_song = Song.new
    song_data = filename.split(" - ") #make into array - first element is artist, second element is name.mp3
    new_song.artist_name = song_data[0]
    new_song.name = song_data[1].delete_suffix(".mp3")
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end
end

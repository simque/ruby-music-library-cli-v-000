class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name) # tap method?
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.map{ |song| song.genre }.uniq
  end

end
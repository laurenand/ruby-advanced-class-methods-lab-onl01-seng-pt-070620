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
    song = self.new
    @@all << song
    song
  end
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song 
  end
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end 
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  def self.alphabetical
    self.all.sort_by {|song| song.name} 
  end
  def self.new_from_filename(filename)
    #song.name = song_name
    #song.artist_name = artist_name
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    
  end 
end

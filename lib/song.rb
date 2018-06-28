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

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = self.new_by_name(name)
  	song.save
  	song
  end

  def self.find_by_name(song_name)
  	self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(by_name)
  	# binding.pry
  	found = self.find_by_name(by_name)
  	if found
  		return found
  	else
  		return self.create_by_name(by_name)
  	end
  end


  def self.alphabetical
  	return self.all.sort_by{|song| song.name}
  end


  def self.new_from_filename(song)
  	without_mp3 = song.chomp(".mp3")
  	song_to_save_array = without_mp3.split(" - ")
  	song_name = song_to_save_array[1]
  	song_artist = song_to_save_array[0]
  	new_song = self.create_by_name(song_name)
  	new_song.artist_name = song_artist
  	# binding.pry
  	new_song
  end


  def self.create_from_filename(song)
  	self.new_from_filename(song).save
  end

  def self.destroy_all
  	self.all.clear
  end
end


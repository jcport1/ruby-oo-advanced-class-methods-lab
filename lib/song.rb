class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #create a class method 

    song = self.new #create a new instance of the song, save it to a variable, so we can call it later

    song.save #save the song by calling save instance method 

    song #return song

  end 

  def self.new_by_name(name)

    song = self.new #create new instance of song, .new is a primiative method, you do not need to build it out in order to call it

    song.name = name #change name of song to the argument you passed in

    song.save #save the song - class methods pushes this into class level variable 

    song #return song instance

  end 

  def self.create_by_name(name)

    song = self.create
    song.name = name
    song 

  end 

  def self.find_by_name(name)

    #iterate through the class variable array to find a match for the name argument passed in 

    @@all.detect {|song| song.name == name } #detech & find are the same

  end 

  def self.find_or_create_by_name(name)
       
    #use the class method we already created on the instance & If/else statement to satisfy conditon 

    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else 
    #   self.create_by_name(name) #use the other class method we created 
    # end

    self.find_by_name(name) || self.create_by_name(name)   #or method 

  end 

  def self.alphabetical

    @@all.sort_by {|song| song.name }  

  end 

  def self.new_from_filename(filename)

    song = self.new #new object to work with
    split_filename = filename.chomp(".mp3").split(" - ") #chomp removes end of string, followed .split which turns it into a aray, seperated by -
    #now we have an array with index 0 being artist name & index 1 being song name
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song 

  end 

  def self.create_from_filename(filename)

    song = self.create 
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song 

  end 

  def self.destroy_all

    @@all = []
    
  end 


end

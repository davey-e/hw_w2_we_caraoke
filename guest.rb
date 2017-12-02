class Guest

  attr_reader :first_name, :last_name, :wallet, :favourite_song

  def initialize(first_name, last_name, wallet, favourite_song)
    @first_name = first_name
    @last_name = last_name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def cheer()
    return "Woohoo!"
  end

end

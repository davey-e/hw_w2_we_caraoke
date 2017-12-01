class Room

  attr_reader :name, :songs, :guests

  def initialize(name, songs, guests)
    @name = name
    @songs = songs
    @guests = guests
  end

  def count_guests_in_room()
    return guests.length()
  end

end

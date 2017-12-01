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

  def is_guest_in_room?(guest)
    return guests.include?(guest)
  end

end

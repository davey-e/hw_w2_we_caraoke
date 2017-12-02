class Room

  attr_reader :name, :songs, :guests

  def initialize(name, songs = [], guests = [])
    @name = name
    @songs = songs
    @guests = guests
  end

  def count_guests_in_room()
    return @guests.length()
  end

  def is_guest_in_room?(guest)
    return @guests.include?(guest)
  end

  def add_guest_to_room(guest)
    @guests.push(guest)
  end

  def remove_guest_from_room(guest)
    return if !is_guest_in_room?(guest)
    return @guests.delete(guest)
  end

  def count_songs_in_room()
    return @songs.length()
  end

  def is_song_in_room?(song)
    return @songs.include?(song)
  end

  def add_song_to_room(song)
    @songs.push(song)
  end

  def remove_song_from_room(song)
    return if !is_song_in_room?(song)
    return @songs.delete(song)
  end

end

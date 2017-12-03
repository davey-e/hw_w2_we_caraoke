require("pry")

class Room

  attr_reader :name, :songs, :guests, :max_guests, :entry_fee, :till

  def initialize(name, songs = [], guests = [], max_guests = 4, entry_fee = 5)
    @name = name
    @songs = songs
    @guests = guests
    @max_guests = max_guests
    @entry_fee = entry_fee
    @till = 0
  end

  def count_guests_in_room()
    return @guests.length()
  end

  def is_guest_in_room?(guest)
    return @guests.include?(guest)
  end

  def add_guest_to_room(guest)
    return if count_guests_in_room + 1 > max_guests
    return if is_guest_in_room?(guest)
    @guests.push(guest)
    receive_entry_fee()
    guest.pay_entry_fee(self)
    return "Woohoo!" if is_guest_fav_song_in_room_playlist?(guest)

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
    return if is_song_in_room?(song)
    return @songs.push(song)
  end

  def remove_song_from_room(song)
    return if !is_song_in_room?(song)
    return @songs.delete(song)
  end

  def is_guest_fav_song_in_room_playlist?(guest)
    for song in @songs
      return true if song.title == guest.favourite_song.title && song.artist == guest.favourite_song.artist
    end
    return false
  end

  def receive_entry_fee()
    @till += @entry_fee
  end

end

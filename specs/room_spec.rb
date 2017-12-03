require("minitest/autorun")
require("minitest/rg")
require_relative("../song")
require_relative("../guest")
require_relative("../room")

class TestRoom < MiniTest::Test

  def setup
    @song1 = Song.new("Baggy Trousers", "Madness")
    @song2 = Song.new("Thriller", "Michael Jackson")
    @song3 = Song.new("Bohemian Rhapsody", "Queen")
    @song4 = Song.new("Happy", "Pharrell Williams")
    @song5 = Song.new("Learn To Fly", "Foo Fighters")
    @song6 = Song.new("Wonderwall", "Oasis")
    @fav_song1 = Song.new("Learn To Fly", "Foo Fighters")
    @fav_song2 = Song.new("Wonderwall", "Oasis")
    @fav_song3 = Song.new("Champagne Supernova", "Oasis")
    @guest1 = Guest.new("Dave", "Ellis", 50, @fav_song1)
    @guest2 = Guest.new("Manny", "Chita", 100, @fav_song2)
    @guest3 = Guest.new("Ross", "Hill", 50, @fav_song3)
    @guest4 = Guest.new("Joe", "Plevin", 50, @fav_song2)
    @guest5 = Guest.new("Max", "Robson", 50, @fav_song1)
    @room1 = Room.new("Prince", [@song1, @song2], [@guest1, @guest2],4,10)
    @room2 = Room.new("Bono", [@song3, @song4], [@guest3, @guest4],6,10)
    @room3 = Room.new("Madonna")

  end

  def test_room_has_name
    expected = "Prince"
    actual = @room1.name
    assert_equal(expected, actual)
  end

  def test_room_has_songs
    expected = [@song1, @song2]
    actual = @room1.songs
    assert_equal(expected, actual)
  end

  def test_room_has_guests
    expected = [@guest1, @guest2]
    actual = @room1.guests
    assert_equal(expected, actual)
  end

  def test_room_has_max_guests_value
    expected = 4
    actual = @room1.max_guests
    assert_equal(expected, actual)
  end

  def test_room_has_entry_fee_value
    expected = 10
    actual = @room1.entry_fee
    assert_equal(expected, actual)
  end

  def test_room_has_till_value
    expected = 0
    actual = @room1.till
    assert_equal(expected, actual)
  end

  def test_room_has_no_songs
    expected = []
    actual = @room3.songs
    assert_equal(expected, actual)
  end

  def test_room_has_no_guests
    expected = []
    actual = @room3.guests
    assert_equal(expected, actual)
  end

  def test_count_number_of_guests_in_room
    expected = 2
    actual = @room1.count_guests_in_room()
    assert_equal(expected, actual)
  end

  def test_is_guest_in_room__true
    expected = true
    actual = @room1.is_guest_in_room?(@guest1)
    assert_equal(expected, actual)
  end

  def test_is_guest_in_room__false
    expected = false
    actual = @room1.is_guest_in_room?(@guest4)
    assert_equal(expected, actual)
  end

  def test_add_guest_to_room__number_of_guests_increased
    @room1.add_guest_to_room(@guest3)
    expected = 3
    actual = @room1.count_guests_in_room()
    assert_equal(expected, actual)
  end

  def test_add_guest_to_room__guest_is_now_in_the_room
    @room1.add_guest_to_room(@guest3)
    expected = true
    actual = @room1.is_guest_in_room?(@guest3)
    assert_equal(expected, actual)
  end

  def test_add_guest_to_room__guest_was_already_in_the_room
    @room1.add_guest_to_room(@guest1)
    expected = 2
    actual = @room1.count_guests_in_room()
    assert_equal(expected, actual)
  end

  def test_remove_guest_from_room__number_of_guests_decreased
    @room1.add_guest_to_room(@guest3)
    @room1.add_guest_to_room(@guest4)
    @room1.remove_guest_from_room(@guest3)
    expected = 3
    actual = @room1.count_guests_in_room()
    assert_equal(expected, actual)
  end

  def test_remove_guest_from_room__guest_no_longer_in_room
    @room1.add_guest_to_room(@guest3)
    @room1.add_guest_to_room(@guest4)
    @room1.remove_guest_from_room(@guest3)
    expected = false
    actual = @room1.is_guest_in_room?(@guest3)
    assert_equal(expected, actual)
  end

  def test_remove_guest_from_room__guest_wasnt_in_room
    @room1.remove_guest_from_room(@guest3)
    expected = 2
    actual = @room1.count_guests_in_room()
    assert_equal(expected, actual)
  end

  def test_count_number_of_songs_in_room
    expected = 2
    actual = @room1.count_songs_in_room()
    assert_equal(expected, actual)
  end

  def test_is_song_in_room__true
    expected = true
    actual = @room1.is_song_in_room?(@song1)
    assert_equal(expected, actual)
  end

  def test_is_song_in_room__false
    expected = false
    actual = @room1.is_song_in_room?(@song4)
    assert_equal(expected, actual)
  end

  def test_add_song_to_room__number_of_songs_increased
    @room1.add_song_to_room(@song3)
    expected = 3
    actual = @room1.count_songs_in_room()
    assert_equal(expected, actual)
  end

  def test_add_song_to_room__song_is_now_in_the_room
    @room1.add_song_to_room(@song3)
    expected = true
    actual = @room1.is_song_in_room?(@song3)
    assert_equal(expected, actual)
  end

  def test_add_song_to_room__song_was_already_in_the_room
    @room1.add_song_to_room(@song1)
    expected = 2
    actual = @room1.count_songs_in_room()
    assert_equal(expected, actual)
  end

  def test_remove_song_from_room__number_of_songs_decreased
    @room1.add_song_to_room(@song3)
    @room1.add_song_to_room(@song4)
    @room1.remove_song_from_room(@song3)
    expected = 3
    actual = @room1.count_songs_in_room()
    assert_equal(expected, actual)
  end

  def test_remove_song_from_room__song_no_longer_in_room
    @room1.add_song_to_room(@song3)
    @room1.add_song_to_room(@song4)
    @room1.remove_song_from_room(@song3)
    expected = false
    actual = @room1.is_song_in_room?(@song3)
    assert_equal(expected, actual)
  end

  def test_remove_song_from_room__song_wasnt_in_room
    @room1.remove_song_from_room(@song3)
    expected = 2
    actual = @room1.count_songs_in_room()
    assert_equal(expected, actual)
  end

  def test_add_guest_doesnt_exceed_room_max_guests
    @room1.add_guest_to_room(@guest3)
    @room1.add_guest_to_room(@guest4)
    @room1.add_guest_to_room(@guest5)
    expected = 4
    actual = @room1.count_guests_in_room()
    assert_equal(expected, actual)
  end

  def test_is_guest_fav_song_in_room_playlist__true
    @room1.add_song_to_room(@song5)
    expected = true
    actual = @room1.is_guest_fav_song_in_room_playlist?(@guest1)
    assert_equal(expected, actual)
  end

  def test_is_guest_fav_song_in_room_playlist__false
    @room1.add_song_to_room(@song6)
    expected = false
    actual = @room1.is_guest_fav_song_in_room_playlist?(@guest3)
    assert_equal(expected, actual)
  end

  def test_guest_cheers_if_fav_song_in_room_playlist
    @room1.add_song_to_room(@song6)
    expected = "Woohoo!"
    actual = @room1.add_guest_to_room(@guest4)
    assert_equal(expected, actual)
  end

end

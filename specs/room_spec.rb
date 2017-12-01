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
    @guest1 = Guest.new("Dave", "Ellis")
    @guest2 = Guest.new("Manny", "Chita")
    @guest3 = Guest.new("Ross", "Hill")
    @guest4 = Guest.new("Joe", "Plevin")
    @room1 = Room.new("Prince", [@song1, @song2], [@guest1, @guest2])
    @room2 = Room.new("Bono", [@song3, @song4], [@guest3, @guest4])
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

  def test_add_guest_to_room__guest_is_in_room
    @room1.add_guest_to_room(@guest3)
    expected = true
    actual = @room1.is_guest_in_room?(@guest3)
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

end

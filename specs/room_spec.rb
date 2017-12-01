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

  def test_count_number_of_guests_in_room
    expected = 2
    actual = @room1.count_guests_in_room()
    assert_equal(expected, actual)
  end

  def test_is_guest_in_room__true
    #expected = true
    #actual = call function to return whether a guest is in a room
    #assert_equal(expected, actual)
  end

  def test_is_guest_in_room__false
    #expected = true
    #actual = call function to return whether a guest is in a room
    #assert_equal(expected, actual)
  end

  def test_add_guest_to_room__number_of_guests_increased
    #call function to add a guest to a room
    #expected = n
    #actual = call function to return number of guests in room (guests array)
    #assert_equal(expected, actual)
  end

  def test_add_guest_to_room__guest_name_exists
    #call function to add a guest to a room
    #expected = true
    #actual = call function to return whether a guest is in a room
    #assert_equal(expected, actual)
  end

end

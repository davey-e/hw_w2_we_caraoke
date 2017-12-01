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

end

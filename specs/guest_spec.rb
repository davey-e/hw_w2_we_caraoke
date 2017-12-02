require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")

class TestGuest < MiniTest::Test

  def setup
    @fav_song1 = Song.new("Learn To Fly", "Foo Fighters")
    @fav_song2 = Song.new("Wonderwall", "Oasis")
    @guest1 = Guest.new("Dave", "Ellis", 50, @fav_song1)
    @guest2 = Guest.new("Manny", "Chita", 100, @fav_song2)
  end

  def test_guest_has_first_name
    expected = "Dave"
    actual = @guest1.first_name
    assert_equal(expected, actual)
  end

  def test_guest_has_last_name
    expected = "Ellis"
    actual = @guest1.last_name
    assert_equal(expected, actual)
  end

  def test_guest_has_wallet
    expected = 50
    actual = @guest1.wallet
    assert_equal(expected, actual)
  end

  def test_guest_has_favourite_song
    expected = @fav_song1
    actual = @guest1.favourite_song
    assert_equal(expected, actual)
  end

  def test_guest_can_cheer
    expected = "Woohoo!"
    actual = @guest1.cheer()
    assert_equal(expected, actual)
  end

end

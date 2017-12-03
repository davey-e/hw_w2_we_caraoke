require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../room")


class TestGuest < MiniTest::Test

  def setup
    @fav_song1 = Song.new("Learn To Fly", "Foo Fighters")
    @fav_song2 = Song.new("Wonderwall", "Oasis")
    @song1 = Song.new("Baggy Trousers", "Madness")
    @song2 = Song.new("Thriller", "Michael Jackson")
    @guest1 = Guest.new("Dave", "Ellis", 50, @fav_song1)
    @guest2 = Guest.new("Manny", "Chita", 100, @fav_song2)
    @room1 = Room.new("Prince", [@song1, @song2], [@guest1, @guest2],4,10)
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

  def test_pay_entry_fee
    @guest1.pay_entry_fee(@room1)
    expected = 40
    actual = @guest1.wallet
    assert_equal(expected, actual)
  end

end

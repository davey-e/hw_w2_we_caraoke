require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Baggy Trousers", "Madness")
    @song2 = Song.new("Thriller", "Michael Jackson")
  end

  def test_song_has_title
    expected = "Baggy Trousers"
    actual = @song1.title
    assert_equal(expected, actual)
  end

  def test_song_has_artist
    expected = "Madness"
    actual = @song1.artist
    assert_equal(expected, actual)
  end

end

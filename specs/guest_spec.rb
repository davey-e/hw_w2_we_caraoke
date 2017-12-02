require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Dave", "Ellis", 50)
    @guest2 = Guest.new("Manny", "Chita", 100)
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

end

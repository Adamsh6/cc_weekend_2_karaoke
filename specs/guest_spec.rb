require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new("Adam", 20)
  end

  def test_get_guest_name
    assert_equal("Adam", @guest1.name)
  end

  def test_get_guest_wallet
    assert_equal(20, @guest1.wallet)
  end

  def test_lose_money
    @guest1.lose_money(10)
    assert_equal(10, @guest1.wallet)
  end
end

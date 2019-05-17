require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @song1 = Song.new("Bat out of Hell")
    @song2 = Song.new("Doves and Stones")
    @song3 = Song.new("Rhinestone Cowboy")
    @song_array = [@song1, @song2]
    @song_array2 = [@song2, @song3]
    @guest1 = Guest.new("Adam", 20, @song1)
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

  def test_get_favourite_song
    assert_equal(@song1, @guest1.favourite_song)
  end

  def test_cheer__favourite_song
    assert_equal("Wooo!", @guest1.cheer(@song_array))
  end

  def test_cheer__other_song
    assert_equal(nil, @guest1.cheer(@song_array2))
  end

end

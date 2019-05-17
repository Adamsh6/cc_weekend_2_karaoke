require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomTest < Minitest::Test

  def setup
    @song1 = Song.new("Two Trains")
    @song2 = Song.new("Bat out of Hell")
    @song3 = Song.new("Take it Easy")
    @guest1 = Guest.new("James", 20)
    @guest2 = Guest.new("Rick", 30)
    @guest3 = Guest.new("Bob", 4)
    @room1 = Room.new(6)
  end

  def test_get_initial_guestlist
    assert_equal(0, @room1.guests.size)
  end

  def test_check_in_guest
    @room1.check_in(@guest1)
    assert_equal(1, @room1.guests.size)
    assert_equal(15, @guest1.wallet)
  end

  def test_check_out_guest
    @room1.check_in(@guest1)
    @room1.check_out(@guest1)
    assert_equal(0, @room1.guests.size)
  end

  def test_get_initial_playlist
    assert_equal(0, @room1.playlist.size)
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal(1, @room1.playlist.size)
  end

  def test_get_space
    assert_equal(6, @room1.space)
  end

  def test_free_space__true
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    assert_equal(true, @room1.free_space?)
  end

  def test_free_space__false
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    assert_equal(false, @room1.free_space?)
  end

  def test_check_in__full
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    @room1.check_in(@guest1)
    assert_equal("Too Full", @room1.check_in(@guest1))
  end

end

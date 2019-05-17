require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < Minitest::Test
  def setup
    @song = Song.new("Bat out of Hell")
  end

  def test_song_name
    assert_equal("Bat out of Hell", @song.name)
  end
end

require('minitest/autorun')
require('minitest/rg')
require_relative('../bar')

class BarTest < Minitest::Test

  def setup
    @menu = {
      "Whisky" => 6,
      "Vodka" => 4,
      "Beer" => 2
    }
    @bar = Bar.new(@menu)
  end

  def test_get_tab
    assert_equal(0, @bar.tab)
  end

  def test_add_to_tab
    @bar.add_to_tab(10)
    assert_equal(10, @bar.tab)
  end

  def test_happy_hour__true
    assert_equal(true, @bar.happy_hour?(18.70))
  end

  def test_happy_hour__false
    assert_equal(false, @bar.happy_hour?(19.10))
  end

  def test_get_menu
    assert_equal(["Whisky", "Vodka", "Beer"], @bar.get_menu)
  end

  def test_get_price
    assert_equal(2, @bar.get_price("Beer"))
  end

end

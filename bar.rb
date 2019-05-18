class Bar

  attr_reader :tab

  def initialize(menu)
    @menu = menu
    @tab = 0
  end

  def add_to_tab(amount)
    @tab += amount
  end

  def get_menu
    return @menu.keys
  end

  def get_price(item)
    return @menu[item]
  end

  def happy_hour?(time)
    time = time.floor.to_i
    return true if time == 18
    return false
  end
end

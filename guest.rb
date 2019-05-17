class Guest

  attr_reader :name, :wallet

  def initialize(name, money)
    @name = name
    @wallet = money
  end

  def lose_money(amount)
    @wallet -= amount
  end
end

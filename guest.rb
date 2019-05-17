class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, money, favourite_song)
    @name = name
    @wallet = money
    @favourite_song = favourite_song
  end

  def lose_money(amount)
    @wallet -= amount
  end

  def cheer(song_list)
    return "Wooo!" if song_list.include?(@favourite_song)
    return nil
  end
end

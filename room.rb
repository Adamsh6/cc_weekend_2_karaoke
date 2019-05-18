require_relative('bar')

class Room

  attr_reader :playlist, :guests, :space, :entry_fee, :bar

  def initialize(space, menu)
    @guests = []
    @playlist = []
    @space = space
    @entry_fee = 5
    @bar = Bar.new(menu)
  end

  def add_song(song)
    @playlist << song
  end

  def check_in(guest)
    return "Too Full" unless free_space?
    @guests << guest
    guest.lose_money(@entry_fee)
    @bar.add_to_tab(@entry_fee)
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def free_space?
    return false if  @guests.size == @space
    return true
  end

  def get_mood
    mood = []
    for guest in guests
      if guest.cheer(@playlist)
        mood << "#{guest.name} says #{guest.cheer(@playlist)}"
      end
    end
    return mood * "\n"
  end

  def buy_drink(guest, drink)
    price = @bar.get_price(drink)
    guest.lose_money(price)
    @bar.add_to_tab(price)
  end

end

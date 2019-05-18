class Room

  attr_reader :playlist, :guests, :space, :entry_fee

  def initialize(space)
    @guests = []
    @playlist = []
    @space = space
    @entry_fee = 5
  end

  def add_song(song)
    @playlist << song
  end

  def check_in(guest)
    return "Too Full" if !(free_space?)
    @guests << guest
    guest.lose_money(@entry_fee)
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

end

class Carnival
  attr_reader :name

  attr_accessor :rides,
                :interests

  def initialize(name)
    @name = name
    @rides = []
    @interests = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommended_rides(attendee)
    rides.map do |ride|
      attendee.interests.include?(ride.name)
    end
  end
end

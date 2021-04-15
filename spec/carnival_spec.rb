require 'rspec'
require './lib/carnival'
require './lib/attendee'
require './lib/ride'

RSpec.describe Carnival do
  it 'exists' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    expect(jeffco_fair).to be_instance_of(Carnival)
  end

  it 'has attributes' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    expect(jeffco_fair.name).to eq("Jefferson County Fair")
    expect(jeffco_fair.rides).to eq([])
  end

  it 'has rides' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})

    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)

    expect(jeffco_fair.rides).to eq([ferris_wheel, bumper_cars, scrambler])
  end

  it 'Adds interests' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})

    bob = Attendee.new('Bob', 20)
    sally = Attendee.new('Sally', 20)

    expect(bob.add_interest('Ferris Wheel')).to eq(['Ferris Wheel'])
  end

   xit 'has recommended_rides' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})

    bob = Attendee.new('Bob', 20)
    sally = Attendee.new('Sally', 20)

    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')


    expect(jeffco_fair.recommended_rides(bob)).to eq([ferris_wheel, bumper_cars])
  end
end

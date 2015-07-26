# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(SFO NYC SPO WHA LON PAR RIO TKO MIL ROM FRA).each do |airport|
  Airport.create code: airport
end

150.times do
  rand_travel = (1..(Airport.count) ).sort_by{rand}[1..2]
  Flight.create(start_id: Airport.find(rand_travel[0]).id, end_id: Airport.find(rand_travel[1]).id, start_time: rand(Time.now..(Time.now + 30.days).to_time), duration: rand(60..(20*60)))
end


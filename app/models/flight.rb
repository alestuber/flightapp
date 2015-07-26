class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: 'Airport', foreign_key: 'start_id'
  belongs_to :to_airport, class_name: 'Airport', foreign_key: 'end_id'

  def self.all_flight_dates
    Flight.all.order(:start_time).map { |f| f.start_time.strftime("%d/%m/%Y") }.uniq
  end
end

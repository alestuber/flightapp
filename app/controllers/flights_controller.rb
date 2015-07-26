class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |a| [a.code, a.id] }
    @passengers = (1..4).to_a
    @flight_dates = Flight.all_flight_dates

    if params.has_key?(:airport)
      if params.key(:date).blank?
        @result_flights = Flight.where(start_id: params[:airport][:from_id], end_id: params[:airport][:to_id])
      else
        @result_flights = Flight.where(start_id: params[:airport][:from_id], end_id: params[:airport][:to_id], start_time: params[:date].to_time..(params[:date].to_time + 1.day))
      end
    end
  end

end

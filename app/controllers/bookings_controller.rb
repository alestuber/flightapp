class BookingsController < ApplicationController
  def new
    @flight = Flight.find params[:flight]
    @booking = @flight.bookings.build
    @passengers_number = params[:passengers_number].to_i
  end

  def create
    @flight = Flight.find params[:booking][:flight_id]
    @booking = @flight.bookings.create booking_params
    redirect_to @booking
  end

  def show
    @booking = Booking.find params[:id]
  end

  private
    def booking_params
      params.require(:booking).permit(passengers_attributes: [:name, :email] )
    end
end

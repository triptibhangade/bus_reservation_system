module BusesHelper
  # -------------------- Available Seats In Particular Bus --------------------
  def available_seat(bus)
    available_seat_count = 0
    bus.reservations.each do |reservation|
      if reservation.reservation_date.strftime("%Y-%m-%d") == params[:date_search] && reservation.status == true
        available_seat_count = available_seat_count + reservation.seat 
      end
    end
    bus.total_no_of_seats - available_seat_count
  end
end

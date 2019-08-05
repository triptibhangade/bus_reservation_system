module BusesHelper
  # -------------------- Available Seat --------------------
  def seat_count(bus)
    seat_count = 0
    bus.reservations.each do |reservation|
      seat_count = seat_count + reservation.seat 
    end
    bus.total_no_of_seats - seat_count
  end
end

module BusesHelper
  # -------------------- Available Seat --------------------
  def seat_count(bus)
    seat_count = 0
    bus.reservations.each do |reservation|
      if reservation.reservation_date.strftime("%d/%m/%Y") == 10.days.from_now.strftime("%d/%m/%Y")

        seat_count = seat_count + reservation.seat 
      end
    end
    bus.total_no_of_seats - seat_count
  end
end

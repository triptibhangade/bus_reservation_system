module ReservationsHelper
  # -------------------- Name of customer --------------------
  def customer_name(reservation)
    if reservation.user_id.present?
      customer = User.find(reservation.user_id)
      customer.name
    else
      bus_owner = BusOwner.find(reservation.bus_owner_id)
      bus_owner.name
    end
  end
  # -------------------- Check Seat Booked Or Not --------------------
  def check_seat_booked?(bus, i)
    bus.reservations.each do |reservation|
      reservation.seats.each do |seat|
        return 1 if seat.seat_no == i
      end
    end
  end
end
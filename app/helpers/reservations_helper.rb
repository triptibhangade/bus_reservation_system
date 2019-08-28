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
  
  # ---------------------- Datewise seat booked or not ----------------------
  def date_wise_seat_booked?(date, seat)
    seats = @bus.seats.joins(:reservation).where(reservations: {reservation_date: date})
    seat_nos = seats.where(reserved: true).map(&:seat_no)
    seat_nos.include?(seat)
  end
   # ---------------------- Active Reservations ----------------------
  def reservation_status(customer)
    customer.reservations.where(status: true)
  end

end

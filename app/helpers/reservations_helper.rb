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

# def date_wise_booking(bus, reservation_date)
#   formated_dates = []
#   dates = []
#   bus.reservations.map do |reservation| # all reservations of bus
#     if !reservation.reservation_date.nil? # reservation date is not nil
#       dates.push(reservation.reservation_date) # all dates push in "dates" array
#     end
#   end
#   dates.each do |date| # all dates of reservations
#     formated_dates.push(date.strftime("%Y-%m-%d")) # all dates push in "formated_date" in format("2019-08-09)
#   end
#   if formated_dates.include?(reservation_date) # reservation date is include or not in "formated_date" array
#     binding.pry
#   end
# end


def date_wise_booking(bus, reservation_date)
  bus.reservations.each do |reservation| # all reservations of bus
    if !reservation.reservation_date.nil? # reservation date is not nil
      if (reservation.reservation_date.strftime("%Y-%m-%d")).include?(reservation_date) # reservation date is include or not
        reservation.seats.ech do |seat| # seats of reservation
          seat.seat_no
        end
      end
    end
  end
end
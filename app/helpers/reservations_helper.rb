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

  def date_of_booking(reservation)
  # strftime("%m/%d/%Y")
    reservation.created_at.to_date.strftime("%d-%m-%Y")
  end

  def day_of_booking(reservation)
  # strftime("%m/%d/%Y")
    reservation.created_at.to_date.strftime("%A")
  end

  def reservation_date(reservation)
    reservation.reservation_date.strftime("%d-%m-%Y")
  end

  def reservation_day(reservation)
    reservation.reservation_date.strftime("%A")
  end
end
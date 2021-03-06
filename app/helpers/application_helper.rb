module ApplicationHelper
  # -------------------- Bus Owner Active--------------------
  def bus_owner_active?(bus_owner)
    bus_owner.status == 'active'
  end
  # -------------------- Bus Owner Suspend --------------------
  def bus_owner_suspend?(bus_owner)
    bus_owner.status == 'suspend'
  end
  # -------------------- Bus Owner Reject --------------------
  def bus_owner_reject?(bus_owner)
    bus_owner.status == 'ignore'
  end
  # -------------------- Reservation booking date format --------------------
  def date_of_booking(reservation)
    reservation.created_at.to_date.strftime("%d-%m-%Y")
  end
  # -------------------- Reservation booking day format --------------------
  def day_of_booking(reservation)
    reservation.created_at.to_date.strftime("%A")
  end
  # -------------------- Reservation date format --------------------
  def reservation_date(reservation)
    reservation.reservation_date.strftime("%d-%m-%Y")
  end
  # -------------------- Reservation day format --------------------
  def reservation_day(reservation)
    reservation.reservation_date.strftime("%A")
  end
end

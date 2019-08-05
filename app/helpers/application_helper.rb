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
    bus_owner.status == 'reject'
  end
end

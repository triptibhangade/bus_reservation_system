module ApplicationHelper
  def bus_owner_active?(bus_owner)
    bus_owner.status == 'active'
  end

  def bus_owner_suspend?(bus_owner)
    bus_owner.status == 'suspend'
  end

  def bus_owner_reject?(bus_owner)
    bus_owner.status == 'reject'
  end
end

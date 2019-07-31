json.extract! bus, :id, :name, :registration_no, :total_no_of_seats, :bus_owner_id, :created_at, :updated_at
json.url bus_url(bus, format: :json)

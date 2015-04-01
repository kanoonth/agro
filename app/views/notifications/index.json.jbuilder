json.array!(@notifications) do |notification|
  json.extract! notification, :id, :cultivated_area_id, :disease_id, :cf
  json.url notification_url(notification, format: :json)
end

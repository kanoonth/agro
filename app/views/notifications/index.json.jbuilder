json.array!(@notifications) do |notification|
  json.extract! notification, :id, :cultivated_area_id, :disease_id, :percent_cf, :created_at
  json.disease_name notification.disease.name
  json.url notification_url(notification, format: :json)
end

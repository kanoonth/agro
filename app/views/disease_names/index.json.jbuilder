json.array!(@disease_names) do |disease_name|
  json.extract! disease_name, :id, :name, :disease_id
  json.url disease_name_url(disease_name, format: :json)
end

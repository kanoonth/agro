json.array!(@soil_type_certainty_factors) do |soil_type_certainty_factor|
  json.extract! soil_type_certainty_factor, :id, :disease_id, :soil_type_id
  json.url soil_type_certainty_factor_url(soil_type_certainty_factor, format: :json)
end

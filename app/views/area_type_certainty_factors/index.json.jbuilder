json.array!(@area_type_certainty_factors) do |area_type_certainty_factor|
  json.extract! area_type_certainty_factor, :id, :disease_id, :area_type_id, :cf
  json.url area_type_certainty_factor_url(area_type_certainty_factor, format: :json)
end
